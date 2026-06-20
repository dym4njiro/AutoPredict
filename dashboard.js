document.addEventListener("DOMContentLoaded", () => {
    const savedName = localStorage.getItem('userRegisteredName');
    const dashboardNameElement = document.getElementById('dashboard-user-name');
    const avatarElement = document.getElementById('user-avatar');

    if (savedName && dashboardNameElement) {
        // 1. Reemplaza el texto por el nombre registrado
        dashboardNameElement.textContent = savedName;

        // 2. Extrae las iniciales de forma automática (Ej: "Juan Pérez" -> "JP")
        const nameParts = savedName.trim().split(" ");
        let initials = "";
        if (nameParts.length > 0 && nameParts[0] !== "") {
            initials += nameParts[0][0]; // Primera letra del primer nombre
            if (nameParts.length > 1) {
                initials += nameParts[nameParts.length - 1][0]; // Primera letra del apellido
            }
        }
        
        // 3. Asigna las iniciales calculadas al círculo del avatar
        if(avatarElement && initials !== "") {
            avatarElement.textContent = initials.toUpperCase();
        }
    }

    // 1. Reloj Superior
    const clockElement = document.getElementById("live-clock");
    setInterval(() => {
        const now = new Date();
        clockElement.textContent = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    }, 1000);

    // 2. Navegación por Pestañas
    const navItems = document.querySelectorAll(".nav-item");
    const viewPanels = document.querySelectorAll(".view-panel");
    const pageTitle = document.getElementById("page-title");

    navItems.forEach(item => {
        item.addEventListener("click", (e) => {
            e.preventDefault();
            navItems.forEach(nav => nav.classList.remove("active"));
            item.classList.add("active");

            viewPanels.forEach(panel => panel.classList.add("hidden"));
            
            const targetId = item.getAttribute("data-target");
            document.getElementById(targetId).classList.remove("hidden");
            
            pageTitle.textContent = item.textContent.replace(/[^\w\s\u00C0-\u00FF]/g, '').trim();
        });
    });

    // 3. Simulación de Telemetría Dinámica
    const liveRpm = document.getElementById("live-rpm");
    const liveTemp = document.getElementById("live-temp");

    setInterval(() => {
        let currentRpm = parseInt(liveRpm.textContent.replace(',', ''));
        let newRpm = currentRpm + (Math.floor(Math.random() * 101) - 50);
        if(newRpm > 3000) newRpm = 2900;
        if(newRpm < 800) newRpm = 900;
        liveRpm.textContent = newRpm.toLocaleString('en-US');

        let currentTemp = parseInt(liveTemp.textContent);
        let newTemp = currentTemp + (Math.floor(Math.random() * 3) - 1);
        if(newTemp > 95) newTemp = 93;
        if(newTemp < 88) newTemp = 89;
        liveTemp.textContent = newTemp + " °C";
    }, 2500);
    
// --- LÓGICA DE COTIZACIONES (US-23) ---
    const selectRepuesto = document.getElementById('tipo-repuesto');
    const costoRepuesto = document.getElementById('costo-repuesto');
    const totalCotizacion = document.getElementById('total-cotizacion');

    if(selectRepuesto) {
        selectRepuesto.addEventListener('change', (e) => {
            if(e.target.value === 'original') {
                costoRepuesto.textContent = 'S/ 200.00';
                totalCotizacion.textContent = 'S/ 320.00';
            } else {
                costoRepuesto.textContent = 'S/ 90.00';
                totalCotizacion.textContent = 'S/ 210.00'; // 120 mano de obra + 90 repuesto alternativo
            }
        });
    }

    // --- LÓGICA DE MODAL DE EVIDENCIA (US-31) ---
    // Función global para abrir el modal desde la tabla del historial
    window.abrirEvidencia = function() {
        document.getElementById('modal-evidencia').classList.remove('hidden');
    };

});