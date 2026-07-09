document.addEventListener("DOMContentLoaded", () => {
<<<<<<< HEAD
=======

    /* ======================================================
       0. NOMBRE DE USUARIO / AVATAR
    ====================================================== */
>>>>>>> 1d6b999 (TF1- archivos actualizados)
    const savedName = localStorage.getItem('userRegisteredName');
    const dashboardNameElement = document.getElementById('dashboard-user-name');
    const avatarElement = document.getElementById('user-avatar');

    if (savedName && dashboardNameElement) {
<<<<<<< HEAD
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
=======
        dashboardNameElement.textContent = savedName;
        const nameParts = savedName.trim().split(" ");
        let initials = "";
        if (nameParts.length > 0 && nameParts[0] !== "") {
            initials += nameParts[0][0];
            if (nameParts.length > 1) {
                initials += nameParts[nameParts.length - 1][0];
            }
        }
        if (avatarElement && initials !== "") {
>>>>>>> 1d6b999 (TF1- archivos actualizados)
            avatarElement.textContent = initials.toUpperCase();
        }
    }

<<<<<<< HEAD
    // 1. Reloj Superior
    const clockElement = document.getElementById("live-clock");
    setInterval(() => {
        const now = new Date();
        clockElement.textContent = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    }, 1000);

    // 2. Navegación por Pestañas
=======
    /* ======================================================
       1. RELOJ SUPERIOR
    ====================================================== */
    const clockElement = document.getElementById("live-clock");
    if (clockElement) {
        setInterval(() => {
            const now = new Date();
            clockElement.textContent = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        }, 1000);
    }

    /* ======================================================
       2. NAVEGACIÓN POR PESTAÑAS (sidebar)
    ====================================================== */
>>>>>>> 1d6b999 (TF1- archivos actualizados)
    const navItems = document.querySelectorAll(".nav-item");
    const viewPanels = document.querySelectorAll(".view-panel");
    const pageTitle = document.getElementById("page-title");

    navItems.forEach(item => {
        item.addEventListener("click", (e) => {
            e.preventDefault();
            navItems.forEach(nav => nav.classList.remove("active"));
            item.classList.add("active");

            viewPanels.forEach(panel => panel.classList.add("hidden"));
<<<<<<< HEAD
            
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
=======

            const targetId = item.getAttribute("data-target");
            
            const targetPanel = document.getElementById(targetId);
            if (targetPanel) targetPanel.classList.remove("hidden");

            if (pageTitle) {
                pageTitle.textContent = item.textContent.replace(/[^\w\s\u00C0-\u00FF]/g, '').trim();
            }
        });
    });

    /* ======================================================
       3. MODAL GENÉRICO REUTILIZABLE
    ====================================================== */
    const appModal = document.getElementById('app-modal');
    const appModalContent = document.getElementById('app-modal-content');
    const appModalClose = document.getElementById('app-modal-close');

    function openModal(html) {
        if (!appModal || !appModalContent) return;
        appModalContent.innerHTML = html;
        appModal.classList.remove('hidden');
    }

    function closeModal() {
        if (!appModal) return;
        appModal.classList.add('hidden');
        appModalContent.innerHTML = '';
    }

    if (appModalClose) appModalClose.addEventListener('click', closeModal);
    if (appModal) {
        appModal.addEventListener('click', (e) => {
            if (e.target === appModal) closeModal();
        });
    }

    /* ======================================================
       ============  PANEL CLIENTE (dashboard.html)  =========
    ====================================================== */
    const vehiculosList = document.getElementById('vehiculos-list');
    if (vehiculosList) {

        // --- 4. MODELO DE DATOS DE VEHÍCULOS ---
        let vehiculos = [
            {
                id: 'v1', nombre: 'Toyota Hilux 2024', placa: 'ABC-123', transmision: 'Automático',
                soat: '15 Nov, 2026', revision: '10 Dic, 2026', activo: true,
                vin: '4T1B11BK0EUXXXXXX', score: '85%', rpm: 2500, temp: 90, bateria: '11.8 V', aceite: '15%'
            },
            {
                id: 'v2', nombre: 'Kia Rio 2018', placa: 'XYZ-789', transmision: 'Mecánico',
                soat: '05 Ene, 2027', revision: '20 Ago, 2026 (Pronto)', activo: false,
                vin: 'KNADN4A31G6XXXXXX', score: '78%', rpm: 2100, temp: 88, bateria: '12.4 V', aceite: '60%'
            }
        ];

        const resumenNombre = document.getElementById('resumen-vehiculo-nombre');
        const resumenVin = document.getElementById('resumen-vehiculo-vin');
        const resumenScore = document.getElementById('resumen-score');
        const resumenBateria = document.getElementById('resumen-bateria');
        const resumenAceite = document.getElementById('resumen-aceite');
        const liveRpm = document.getElementById("live-rpm");
        const liveTemp = document.getElementById("live-temp");

        function getVehiculoActivo() {
            return vehiculos.find(v => v.activo) || vehiculos[0];
        }

        function renderResumen() {
            const activo = getVehiculoActivo();
            if (!activo) return;
            if (resumenNombre) resumenNombre.textContent = activo.nombre;
            if (resumenVin) resumenVin.textContent = activo.vin;
            if (resumenScore) resumenScore.textContent = activo.score;
            if (resumenBateria) resumenBateria.textContent = activo.bateria;
            if (resumenAceite) resumenAceite.textContent = activo.aceite;
            if (liveRpm) liveRpm.textContent = activo.rpm.toLocaleString('en-US');
            if (liveTemp) liveTemp.textContent = activo.temp + " °C";
        }

        function renderVehiculos() {
            vehiculosList.innerHTML = vehiculos.map(v => {
                const activoStyle = v.activo ? 'border-color: var(--accent-neon);' : '';
                const tag = v.activo
                    ? '<span class="tag" style="background: var(--success); color: white;">Activo</span>'
                    : '';
                const boton = v.activo
                    ? `<button class="btn-outline mt-10" data-accion="telemetria" data-id="${v.id}">Ver Telemetría</button>`
                    : `<button class="btn-outline mt-10" data-accion="activar" data-id="${v.id}" style="border-color: var(--text-muted); color: var(--text-muted);">Cambiar a este vehículo</button>`;

                return `
                <div class="data-card" style="${activoStyle}">
                    <div style="display: flex; justify-content: space-between;">
                        <h3>${v.nombre}</h3>
                        ${tag}
                    </div>
                    <p class="text-muted">Placa: ${v.placa} | ${v.transmision}</p>
                    <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 15px 0;">
                    <p><strong>SOAT Vence:</strong> ${v.soat}</p>
                    <p><strong>Revisión Técnica:</strong> ${v.revision}</p>
                    ${boton}
                 </div>`;
            }).join('');
        }

        vehiculosList.addEventListener('click', (e) => {
            const btn = e.target.closest('[data-accion]');
            if (!btn) return;
            const id = btn.getAttribute('data-id');
            const vehiculo = vehiculos.find(v => v.id === id);
            if (!vehiculo) return;

            if (btn.getAttribute('data-accion') === 'activar') {
                vehiculos.forEach(v => v.activo = (v.id === id));
                renderVehiculos();
                renderResumen();
                alert(`Listo. Ahora estás monitoreando el ${vehiculo.nombre}. El resumen de flota y la telemetría en vivo se actualizaron.`);
            }

            if (btn.getAttribute('data-accion') === 'telemetria') {
                openModal(`
                    <h3>Telemetría en vivo — ${vehiculo.nombre}</h3>
                    <p class="text-muted mb-15">VIN: ${vehiculo.vin}</p>
                    <div class="grid-2">
                        <div class="data-card"><p class="card-title">RPM Motor</p><h3 class="card-value">${vehiculo.rpm.toLocaleString('en-US')}</h3></div>
                        <div class="data-card"><p class="card-title">Temp. Refrigerante</p><h3 class="card-value text-accent">${vehiculo.temp} °C</h3></div>
                        <div class="data-card"><p class="card-title">Voltaje Batería</p><h3 class="card-value">${vehiculo.bateria}</h3></div>
                        <div class="data-card"><p class="card-title">Vida del Aceite</p><h3 class="card-value">${vehiculo.aceite}</h3></div>
                    </div>
                    <p class="text-muted mt-10">Score de salud general: <strong class="text-accent">${vehiculo.score}</strong></p>
                `);
            }
        });

        // --- Agregar Vehículo ---
        const btnAgregarVehiculo = document.getElementById('btn-agregar-vehiculo');
        if (btnAgregarVehiculo) {
            btnAgregarVehiculo.addEventListener('click', () => {
                openModal(`
                    <h3>Agregar Vehículo</h3>
                    <p class="text-muted mb-15">Regístralo para empezar a monitorear su telemetría.</p>
                    <label class="form-label">Marca y modelo</label>
                    <input type="text" id="nv-nombre" class="form-input" placeholder="Ej: Honda CR-V 2022">
                    <label class="form-label">Placa</label>
                    <input type="text" id="nv-placa" class="form-input" placeholder="Ej: XYZ-000">
                    <label class="form-label">Transmisión</label>
                    <select id="nv-transmision" class="form-input">
                        <option value="Automático">Automático</option>
                        <option value="Mecánico">Mecánico</option>
                    </select>
                    <label class="form-label">SOAT vence</label>
                    <input type="text" id="nv-soat" class="form-input" placeholder="Ej: 20 Dic, 2026">
                    <label class="form-label">Revisión técnica</label>
                    <input type="text" id="nv-revision" class="form-input" placeholder="Ej: 15 Feb, 2027">
                    <div class="modal-actions">
                        <button class="btn-outline" id="nv-cancelar">Cancelar</button>
                        <button class="btn-primary" id="nv-guardar">Guardar Vehículo</button>
                    </div>
                `);
                document.getElementById('nv-cancelar').addEventListener('click', closeModal);
                document.getElementById('nv-guardar').addEventListener('click', () => {
                    const nombre = document.getElementById('nv-nombre').value.trim();
                    const placa = document.getElementById('nv-placa').value.trim();
                    if (!nombre || !placa) {
                        alert('Por favor completa al menos la marca/modelo y la placa.');
                        return;
                    }
                    const nuevo = {
                        id: 'v' + (vehiculos.length + 1) + '-' + Date.now(),
                        nombre,
                        placa,
                        transmision: document.getElementById('nv-transmision').value,
                        soat: document.getElementById('nv-soat').value.trim() || 'Sin registrar',
                        revision: document.getElementById('nv-revision').value.trim() || 'Sin registrar',
                        activo: false,
                        vin: 'VIN-' + Math.random().toString(36).substring(2, 12).toUpperCase(),
                        score: '—', rpm: 900, temp: 88, bateria: '12.6 V', aceite: '100%'
                    };
                    vehiculos.push(nuevo);
                    renderVehiculos();
                    closeModal();
                    alert(`${nombre} fue agregado a tu flota.`);
                });
            });
        }

        renderVehiculos();
        renderResumen();

        // --- Simulación de telemetría dinámica del vehículo activo ---
        setInterval(() => {
            const activo = getVehiculoActivo();
            if (!activo || !liveRpm || !liveTemp) return;

            let newRpm = activo.rpm + (Math.floor(Math.random() * 101) - 50);
            if (newRpm > 3000) newRpm = 2900;
            if (newRpm < 800) newRpm = 900;
            activo.rpm = newRpm;
            liveRpm.textContent = newRpm.toLocaleString('en-US');

            let newTemp = activo.temp + (Math.floor(Math.random() * 3) - 1);
            if (newTemp > 95) newTemp = 93;
            if (newTemp < 88) newTemp = 89;
            activo.temp = newTemp;
            liveTemp.textContent = newTemp + " °C";
        }, 2500);
    }

    /* ======================================================
       5. HISTORIAL CLÍNICO — FILTRO POR PALABRAS CLAVE
    ====================================================== */
    const inputFiltro = document.getElementById('input-filtro-historial');
    const btnFiltrar = document.getElementById('btn-filtrar-historial');
    const btnLimpiarFiltro = document.getElementById('btn-limpiar-filtro-historial');
    const historialTbody = document.getElementById('historial-tbody');
    const historialVacio = document.getElementById('historial-vacio');

    if (historialTbody) {
        // Diccionario de sinónimos
        const sinonimos = {
            'frenos': ['freno', 'frenos', 'pastilla', 'pastillas', 'disco', 'discos'],
            'freno': ['freno', 'frenos', 'pastilla', 'pastillas', 'disco', 'discos'],
            'aceite': ['aceite', 'lubricante', 'mantenimiento'],
            'motor': ['motor', 'cilindro', 'cilindros', 'bujía', 'bujia', 'bujías', 'misfire', 'obd', 'obd-ii'],
            'bateria': ['batería', 'bateria', 'alternador', 'eléctrico', 'electrico', 'voltaje'],
            'batería': ['batería', 'bateria', 'alternador', 'eléctrico', 'electrico', 'voltaje'],
        };

        function filtrarHistorial() {
            const termino = (inputFiltro.value || '').trim().toLowerCase();
            const filas = historialTbody.querySelectorAll('tr');
            let visibles = 0;

            if (!termino) {
                filas.forEach(f => f.classList.remove('hidden'));
                historialVacio.classList.add('hidden');
                return;
            }

            const palabrasClave = sinonimos[termino] || [termino];
            filas.forEach(fila => {
                const servicio = (fila.getAttribute('data-servicio') || fila.textContent).toLowerCase();
                const coincide = palabrasClave.some(p => servicio.includes(p));
                fila.classList.toggle('hidden', !coincide);
                if (coincide) visibles++;
            });
            historialVacio.classList.toggle('hidden', visibles > 0);
        }

        if (btnFiltrar) btnFiltrar.addEventListener('click', filtrarHistorial);
        if (inputFiltro) inputFiltro.addEventListener('keyup', (e) => {
            if (e.key === 'Enter') filtrarHistorial();
        });
        if (btnLimpiarFiltro) btnLimpiarFiltro.addEventListener('click', () => {
            inputFiltro.value = '';
            filtrarHistorial();
        });

        // --- Evidencia / Boleta / Reporte unificados ---
        const modalEvidencia = document.getElementById('modal-evidencia');
        historialTbody.addEventListener('click', (e) => {
            const btn = e.target.closest('button[data-tipo]');
            if (!btn || !modalEvidencia) return;

            const tipo = btn.getAttribute('data-tipo');
            const titulos = { evidencia: 'Evidencia del Servicio', boleta: 'Boleta del Servicio', reporte: 'Reporte de Diagnóstico' };

            modalEvidencia.querySelector('h3').textContent = titulos[tipo] || 'Detalle del Servicio';
            modalEvidencia.querySelector('.text-muted.mb-15').textContent =
                `Taller: ${btn.getAttribute('data-taller')} | Fecha: ${btn.getAttribute('data-fecha')}`;
            modalEvidencia.querySelector('p strong').parentElement.innerHTML =
                `<strong>Nota:</strong> ${btn.getAttribute('data-nota')}`;

            // Personalizamos el contenido del cuadro según el botón
            const visualContent = modalEvidencia.querySelector('div[style*="height: 250px"]');
            if (tipo === 'evidencia') {
                visualContent.innerHTML = '<span class="text-muted">📷 Imagen evidencial de la avería</span>';
            } else if (tipo === 'boleta') {
                visualContent.innerHTML = '<span class="text-muted" style="font-size:3rem;">🧾</span><br><span class="text-muted">Documento: Boleta Electrónica</span>';
            } else if (tipo === 'reporte') {
                visualContent.innerHTML = '<span class="text-muted" style="font-size:3rem;">📄</span><br><span class="text-muted">Documento: Reporte de Escaneo</span>';
            }

            modalEvidencia.classList.remove('hidden');
        });
    }

    /* ======================================================
       6. BUSCAR TALLERES
    ====================================================== */
    const panelTalleres = document.getElementById('panel-talleres');
    if (panelTalleres) {
        panelTalleres.addEventListener('click', (e) => {
            const btn = e.target.closest('button[data-tipo]');
            if (!btn) return;
            const taller = btn.getAttribute('data-taller');
            const direccion = btn.getAttribute('data-direccion');
            const rating = btn.getAttribute('data-rating');
            const tipo = btn.getAttribute('data-tipo');

            const horarios = tipo === 'manana'
                ? ['08:00 AM', '09:30 AM', '11:00 AM', '02:00 PM']
                : ['Hoy 03:30 PM', 'Hoy 05:00 PM', 'Mañana 08:00 AM'];

            openModal(`
                <h3>${taller}</h3>
                <p class="text-muted mb-15">${direccion} · ${rating}</p>
                <p><strong>${tipo === 'manana' ? 'Horarios disponibles mañana:' : 'Horarios disponibles:'}</strong></p>
                <div class="mt-10" id="lista-horarios">
                    ${horarios.map(h => `<button class="slot-btn" data-hora="${h}">${h}</button>`).join('')}
                </div>
            `);

            document.getElementById('lista-horarios').addEventListener('click', (ev) => {
                const slot = ev.target.closest('.slot-btn');
                if (!slot) return;
                const hora = slot.getAttribute('data-hora');
                if (typeof window.agendarCita === 'function') {
                    window.agendarCita(taller, hora);
                }
                closeModal();
                document.querySelector('[data-target="panel-agenda"]').click();
                alert(`Cita agendada con ${taller} para: ${hora}`);
            });
        });
    }

    /* ======================================================
       7. GESTIÓN DE CITAS (Mis Citas)
    ====================================================== */
    const citaContainer = document.getElementById('cita-actual-container');
    let citaActual = {
        vehiculo: 'Toyota Hilux (ABC-123)',
        taller: 'San Luis Motors',
        fecha: 'Mañana, 09:00 AM',
        motivo: 'Revisión de código P0171 (Predicción de IA)'
    };

    function renderCita() {
        if (!citaContainer) return;

        if (!citaActual) {
            citaContainer.innerHTML = `
                <div class="data-card empty-state">
                    <p>No tienes citas programadas.</p>
                    <button class="btn-outline mt-10" onclick="document.querySelector('[data-target=\\'panel-talleres\\']').click();">Buscar un taller</button>
                </div>`;
            return;
        }
        citaContainer.innerHTML = `
            <div class="data-card" style="border-left: 4px solid var(--accent-neon);">
                <h3 class="text-accent">Cita Confirmada</h3>
                <p class="text-muted">Para: ${citaActual.vehiculo}</p>
                <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 15px 0;">
                <p><strong>Taller:</strong> ${citaActual.taller}</p>
                <p><strong>Fecha:</strong> ${citaActual.fecha} <span class="tag tag-yellow">Hora recomendada</span></p>
                <p><strong>Motivo:</strong> ${citaActual.motivo}</p>
                <div style="display: flex; gap: 10px; margin-top: 15px;">
                    <button class="btn-outline" id="btn-cancelar-cita" style="border-color: var(--danger); color: var(--danger);">Cancelar</button>
                    <button class="btn-primary" id="btn-reprogramar-cita" style="flex: 1;">Reprogramar</button>
                </div>
            </div>`;

        document.getElementById('btn-cancelar-cita').addEventListener('click', () => {
            const confirmado = confirm('¿Seguro que quieres cancelar esta cita?');
            if (confirmado) {
                citaActual = null;
                renderCita();
            }
        });

        document.getElementById('btn-reprogramar-cita').addEventListener('click', () => {
            openModal(`
                <h3>Reprogramar cita</h3>
                <p class="text-muted mb-15">${citaActual.taller} — ${citaActual.vehiculo}</p>
                <label class="form-label">Nueva fecha</label>
                <input type="date" id="rp-fecha" class="form-input">
                <label class="form-label">Nueva hora</label>
                <input type="time" id="rp-hora" class="form-input">
                <div class="modal-actions">
                    <button class="btn-outline" id="rp-cancelar">Cancelar</button>
                    <button class="btn-primary" id="rp-confirmar">Confirmar Reprogramación</button>
                </div>
            `);
            document.getElementById('rp-cancelar').addEventListener('click', closeModal);
            document.getElementById('rp-confirmar').addEventListener('click', () => {
                const fecha = document.getElementById('rp-fecha').value;
                const hora = document.getElementById('rp-hora').value;
                if (!fecha || !hora) {
                    alert('Selecciona una fecha y hora válidas.');
                    return;
                }
                const fechaLegible = new Date(fecha + 'T' + hora).toLocaleString('es-PE', {
                    day: '2-digit', month: 'short', hour: '2-digit', minute: '2-digit'
                });
                citaActual.fecha = fechaLegible;
                renderCita();
                closeModal();
                alert('Tu cita fue reprogramada correctamente.');
            });
        });
    }

    window.agendarCita = function (taller, hora) {
        const banner = document.getElementById('resumen-vehiculo-nombre');
        citaActual = {
            vehiculo: banner ? banner.textContent : 'Vehículo',
            taller: taller,
            fecha: hora,
            motivo: 'Cita agendada desde Buscar Talleres'
        };
        renderCita();
    };

    if (citaContainer) renderCita();

    /* ======================================================
       8. ALERTAS: marcar como leída
    ====================================================== */
    const alertasNoLeidas = document.getElementById('alertas-no-leidas-list');
    const alertasLeidas = document.getElementById('alertas-leidas-list');
    const alertasLeidasVacio = document.getElementById('alertas-leidas-vacio');
    const alertasVacio = document.getElementById('alertas-vacio');

    if (alertasNoLeidas) {
        alertasNoLeidas.innerHTML = `
            <div class="alert-item">
                <div>
                    <strong>⚠️ Voltaje Bajo Detectado</strong>
                    <p class="text-muted">El alternador presenta anomalías. Agenda revisión preventiva para evitar quedarte varado.</p>
                </div>
                <button class="btn-outline" data-accion="marcar-leida">Marcar como leída</button>
            </div>`;

        function actualizarVacioAlertas() {
            if (!alertasVacio) return;
            alertasVacio.classList.toggle('hidden', alertasNoLeidas.children.length > 0);
        }

        alertasNoLeidas.addEventListener('click', (e) => {
            const btn = e.target.closest('[data-accion="marcar-leida"]');
            if (!btn) return;
            const item = btn.closest('.alert-item');
            item.classList.add('leida');
            btn.remove();
            if (alertasLeidas) alertasLeidas.appendChild(item);
            if (alertasLeidasVacio) alertasLeidasVacio.classList.add('hidden');
            actualizarVacioAlertas();
            const badge = document.querySelector('[data-target="panel-alertas"] .badge');
            if (badge) badge.remove();
        });

        actualizarVacioAlertas();
    }

    /* ======================================================
       9. COTIZACIONES
    ====================================================== */
    const cotizacionesPendientes = document.getElementById('cotizaciones-pendientes-list');
    const cotizacionesHistorial = document.getElementById('cotizaciones-historial-list');
    const cotizacionesHistorialVacio = document.getElementById('cotizaciones-historial-vacio');
    const cotizacionesVacio = document.getElementById('cotizaciones-vacio');

    if (cotizacionesPendientes) {
        function cotizacionCardHTML() {
            return `
            <div class="data-card mt-10" style="max-width: 700px; border-left: 4px solid var(--warning);">
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <h3>San Luis Motors</h3>
                    <span class="tag tag-yellow">Pendiente de Aprobación</span>
                </div>
                <p class="text-muted mt-10">Diagnóstico: Anomalía múltiple en cilindros (P0300)</p>

                <table class="data-table mt-10">
                    <thead>
                        <tr><th>Descripción</th><th>Tipo</th><th style="text-align: right;">Costo</th></tr>
                    </thead>
                    <tbody>
                        <tr><td>Mano de obra - Revisión e instalación</td><td>Servicio</td><td style="text-align: right;">S/ 120.00</td></tr>
                        <tr><td>Juego de Bujías x4</td><td>Repuesto</td><td style="text-align: right;" id="costo-repuesto">S/ 200.00</td></tr>
                    </tbody>
                </table>

                <div style="background: rgba(255,255,255,0.05); padding: 15px; border-radius: 8px; margin-top: 15px; display: flex; justify-content: space-between; align-items: center;">
                    <div>
                        <strong>Calidad del repuesto</strong>
                        <p class="text-muted" style="font-size: 0.8rem;">Alternativo reduce el costo pero tiene menos garantía.</p>
                    </div>
                    <select id="tipo-repuesto" style="padding: 8px; background: var(--bg-dark); color: white; border: 1px solid var(--border-color); border-radius: 4px;">
                        <option value="original">Original (S/ 200.00)</option>
                        <option value="alternativo">Alternativo (S/ 90.00)</option>
                    </select>
                </div>

                <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">
                    <h2 style="margin: 0;">Total: <span class="text-accent" id="total-cotizacion">S/ 320.00</span></h2>
                    <div style="display: flex; gap: 10px;">
                        <button class="btn-outline" id="btn-rechazar-cotizacion" style="border-color: var(--danger); color: var(--danger);">Rechazar</button>
                        <button class="btn-primary" id="btn-aprobar-cotizacion">Aprobar Presupuesto</button>
                    </div>
                </div>
            </div>`;
        }

        function agregarAlHistorial(estado, total) {
            if (cotizacionesHistorialVacio) cotizacionesHistorialVacio.classList.add('hidden');
            const etiqueta = estado === 'aprobada'
                ? '<span class="tag" style="background: var(--success); color:white;">Aprobada</span>'
                : '<span class="tag tag-red">Rechazada</span>';
            const item = document.createElement('div');
            item.className = 'alert-item';
            item.style.borderLeftColor = estado === 'aprobada' ? 'var(--success)' : 'var(--danger)';
            item.innerHTML = `
                <div>
                    <strong>San Luis Motors</strong>
                    <p class="text-muted">Total: ${total}</p>
                </div>
                ${etiqueta}`;
            cotizacionesHistorial.prepend(item);
        }

        function renderCotizacionPendiente() {
            cotizacionesPendientes.innerHTML = cotizacionCardHTML();
            if (cotizacionesVacio) cotizacionesVacio.classList.add('hidden');

            const selectRepuesto = document.getElementById('tipo-repuesto');
            const costoRepuesto = document.getElementById('costo-repuesto');
            const totalCotizacion = document.getElementById('total-cotizacion');

            selectRepuesto.addEventListener('change', (e) => {
                if (e.target.value === 'original') {
                    costoRepuesto.textContent = 'S/ 200.00';
                    totalCotizacion.textContent = 'S/ 320.00';
                } else {
                    costoRepuesto.textContent = 'S/ 90.00';
                    totalCotizacion.textContent = 'S/ 210.00';
                }
            });

            document.getElementById('btn-aprobar-cotizacion').addEventListener('click', () => {
                agregarAlHistorial('aprobada', totalCotizacion.textContent);
                cotizacionesPendientes.innerHTML = '';
                if (cotizacionesVacio) cotizacionesVacio.classList.remove('hidden');
                alert('Cotización aprobada. El taller iniciará el trabajo.');
            });

            document.getElementById('btn-rechazar-cotizacion').addEventListener('click', () => {
                const confirmado = confirm('¿Seguro que quieres rechazar esta cotización?');
                if (!confirmado) return;
                agregarAlHistorial('rechazada', totalCotizacion.textContent);
                cotizacionesPendientes.innerHTML = '';
                if (cotizacionesVacio) cotizacionesVacio.classList.remove('hidden');
                alert('Cotización rechazada. Se lo notificamos al taller.');
            });
        }

        renderCotizacionPendiente();
    }

    /* ======================================================
       10. PAGOS Y FACTURAS
    ====================================================== */
    const btnDescargarBoleta = document.getElementById('btn-descargar-boleta');

    if (btnDescargarBoleta) {
        btnDescargarBoleta.addEventListener('click', () => {
            const contenido =
`AutoPredict - Boleta de Servicio
----------------------------------
Servicio completado el 17 Mayo, 2026
Mantenimiento Preventivo........ S/ 250.00
Escaneo OBD-II................... S/ 50.00
----------------------------------
Total a pagar: S/ 300.00
Gracias por confiar en AutoPredict.`;
            const blob = new Blob([contenido], { type: 'text/plain' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = 'Boleta_AutoPredict.txt';
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
        });
    }

    const btnAnadirTarjeta = document.getElementById('btn-anadir-tarjeta');
    const tarjetasList = document.getElementById('tarjetas-list');

    if (btnAnadirTarjeta) {
        btnAnadirTarjeta.addEventListener('click', () => {
            openModal(`
                <h3>Añadir Tarjeta</h3>
                <label class="form-label">Nombre en la tarjeta</label>
                <input type="text" id="tc-nombre" class="form-input" placeholder="Ej: Juan Pérez">
                <label class="form-label">Número de tarjeta</label>
                <input type="text" id="tc-numero" class="form-input" placeholder="0000 0000 0000 0000" maxlength="19">
                <div style="display: flex; gap: 10px;">
                    <div style="flex:1;">
                        <label class="form-label">Vencimiento (MM/AA)</label>
                        <input type="text" id="tc-venc" class="form-input" placeholder="12/28" maxlength="5">
                    </div>
                    <div style="flex:1;">
                        <label class="form-label">CVV</label>
                        <input type="password" id="tc-cvv" class="form-input" placeholder="123" maxlength="4">
                    </div>
                </div>
                <label class="form-label">Dirección de facturación</label>
                <input type="text" id="tc-direccion" class="form-input" placeholder="Ej: Av. Larco 123, Miraflores, Lima">
                <div class="modal-actions">
                    <button class="btn-outline" id="tc-cancelar">Cancelar</button>
                    <button class="btn-primary" id="tc-guardar">Guardar Tarjeta</button>
                </div>
            `);

            document.getElementById('tc-cancelar').addEventListener('click', closeModal);
            document.getElementById('tc-guardar').addEventListener('click', () => {
                const nombre = document.getElementById('tc-nombre').value.trim();
                const numero = document.getElementById('tc-numero').value.replace(/\s/g, '');
                const venc = document.getElementById('tc-venc').value.trim();
                const cvv = document.getElementById('tc-cvv').value.trim();
                const direccion = document.getElementById('tc-direccion').value.trim();

                if (!nombre || numero.length < 12 || !venc || cvv.length < 3 || !direccion) {
                    alert('Revisa los datos de la tarjeta: nombre, número, vencimiento, CVV y dirección son obligatorios.');
                    return;
                }
                const ultimos4 = numero.slice(-4);
                const tipo = numero.startsWith('4') ? 'Visa' : (numero.startsWith('5') ? 'Mastercard' : 'Tarjeta');

                const card = document.createElement('div');
                card.className = 'alert-item';
                card.style.borderLeftColor = 'var(--text-muted)';
                card.style.marginTop = '15px';
                card.innerHTML = `
                    <div>
                        <strong>${tipo} terminada en ${ultimos4}</strong>
                        <p class="text-muted">Vence: ${venc} · ${nombre}</p>
                    </div>`;
                tarjetasList.appendChild(card);
                closeModal();
                alert('Tarjeta añadida correctamente.');
            });
        });
    }

    const btnHistorialFacturas = document.getElementById('btn-historial-facturas');

    if (btnHistorialFacturas) {
        btnHistorialFacturas.addEventListener('click', () => {
            const facturas = [
                { fecha: '17 Mayo, 2026', concepto: 'Mantenimiento Preventivo + OBD-II', monto: 'S/ 300.00', estado: 'Pagada' },
                { fecha: '12 Mayo, 2026', concepto: 'Cambio de Pastillas de Freno', monto: 'S/ 180.00', estado: 'Pagada' },
                { fecha: '03 Abril, 2026', concepto: 'Mantenimiento 10,000 Km', monto: 'S/ 250.00', estado: 'Pagada' },
                { fecha: '15 Enero, 2026', concepto: 'Escaneo OBD-II', monto: 'S/ 50.00', estado: 'Pagada' }
            ];
            openModal(`
                <h3>Historial de Facturas</h3>
                <table class="data-table mt-10">
                    <thead><tr><th>Fecha</th><th>Concepto</th><th>Monto</th><th>Estado</th></tr></thead>
                    <tbody>
                        ${facturas.map(f => `<tr><td>${f.fecha}</td><td>${f.concepto}</td><td>${f.monto}</td><td class="text-success">${f.estado}</td></tr>`).join('')}
                    </tbody>
                </table>
            `);
        });
    }

    /* ======================================================
       11. REPORTES ANALÍTICOS
    ====================================================== */
    const selectRango = document.getElementById('select-rango-reporte');

    if (selectRango) {
        const datasets = {
            '30d': {
                titulo: 'Gastos en Mantenimiento vs Combustible (Últimos 30 días)',
                nota: 'El pico corresponde a una revisión de frenos realizada esta semana.',
                barras: [
                    { label: 'Sem 1', valor: 30, color: 'var(--accent-neon)' },
                    { label: 'Sem 2', valor: 65, color: 'var(--danger)' },
                    { label: 'Sem 3', valor: 45, color: 'var(--accent-neon)' },
                    { label: 'Sem 4', valor: 25, color: 'var(--accent-neon)' }
                ],
                prediccion: [
                    { nombre: 'Batería', valor: '8 meses restantes', ancho: '30%', color: 'var(--warning)' },
                    { nombre: 'Pastillas de Freno', valor: '15,000 km restantes', ancho: '70%', color: 'var(--success)' },
                    { nombre: 'Correa de Distribución', valor: '2,000 km restantes ⚠️', ancho: '10%', color: 'var(--danger)' }
                ]
            },
            'anio': {
                titulo: 'Gastos en Mantenimiento vs Combustible (Este Año)',
                nota: 'El pico de febrero corresponde a la reparación del alternador.',
                barras: [
                    { label: 'Ene', valor: 40, color: 'var(--accent-neon)' },
                    { label: 'Feb', valor: 70, color: 'var(--danger)' },
                    { label: 'Mar', valor: 50, color: 'var(--accent-neon)' },
                    { label: 'Abr', valor: 30, color: 'var(--accent-neon)' },
                    { label: 'May', valor: 55, color: 'var(--accent-neon)' },
                    { label: 'Jun', valor: 20, color: 'var(--accent-neon)' }
                ],
                prediccion: [
                    { nombre: 'Batería', valor: '5 meses restantes', ancho: '18%', color: 'var(--danger)' },
                    { nombre: 'Pastillas de Freno', valor: '9,000 km restantes', ancho: '45%', color: 'var(--warning)' },
                    { nombre: 'Correa de Distribución', valor: '14,000 km restantes', ancho: '65%', color: 'var(--success)' }
                ]
            }
        };

        const graficoGastos = document.getElementById('grafico-gastos');
        const tituloGrafico = document.getElementById('titulo-grafico-gastos');
        const notaGrafico = document.getElementById('nota-grafico-gastos');
        const prediccionContainer = document.getElementById('prediccion-vida-util');

        function renderReporte(rango) {
            const data = datasets[rango];
            if (!data) return;

            tituloGrafico.textContent = data.titulo;
            notaGrafico.textContent = data.nota;
            graficoGastos.innerHTML = data.barras.map(b => `
                <div style="flex: 1; background: ${b.color}; height: ${b.valor}%; border-radius: 4px 4px 0 0; position: relative;">
                    <span style="position: absolute; top: -25px; left: 30%; color: var(--text-muted);">${b.label}</span>
                </div>`).join('');

            prediccionContainer.innerHTML = data.prediccion.map(p => `
                <p><strong>${p.nombre}:</strong> ${p.valor}</p>
                <div class="progress-bar" style="background: var(--bg-dark); border-radius: 5px; margin: 5px 0 15px 0; height: 10px;">
                    <div style="width: ${p.ancho}; background: ${p.color}; height: 100%; border-radius: 5px;"></div>
                </div>`).join('');
        }

        selectRango.addEventListener('change', (e) => renderReporte(e.target.value));
        renderReporte('30d');
    }

    /* ======================================================
       ============  PANEL TALLER (dashboard-taller.html)  ===
    ====================================================== */
    const citasHoyTbody = document.getElementById('citas-hoy-tbody');

    if (citasHoyTbody) {
        const vehiculosTallerList = document.getElementById('vehiculos-taller-list');
        const citasHoyVacio = document.getElementById('citas-hoy-vacio');

        // --- Recibir vehículo ---
        citasHoyTbody.addEventListener('click', (e) => {
            const btn = e.target.closest('button');
            if (!btn || btn.disabled) return;
            const fila = btn.closest('tr');
            const vehiculo = btn.getAttribute('data-vehiculo');
            const cliente = btn.getAttribute('data-cliente');
            const placa = btn.getAttribute('data-placa');
            const hora = btn.getAttribute('data-hora');

            const nuevaTarjeta = document.createElement('div');
            nuevaTarjeta.className = 'alert-item';
            nuevaTarjeta.style.borderLeftColor = 'var(--warning)';
            nuevaTarjeta.style.marginTop = '10px';
            nuevaTarjeta.innerHTML = `
                <div>
                    <strong>${vehiculo} (${placa}) - ${cliente}</strong>
                    <p class="text-muted">Ingresó a las ${hora} · Pendiente de diagnóstico</p>
                </div>
                <span class="tag tag-yellow">Recién Recibido</span>`;
            vehiculosTallerList.appendChild(nuevaTarjeta);

            fila.remove();
            if (citasHoyTbody.children.length === 0 && citasHoyVacio) {
                citasHoyVacio.classList.remove('hidden');
            }

            alert(`${vehiculo} fue recibido y añadido a "Vehículos en Taller".`);
        });

        // --- Pausar Recepción ---
        const btnPausar = document.getElementById('btn-pausar-recepcion');
        const bannerAgendaLlena = document.getElementById('banner-agenda-llena');
        let recepcionPausada = false;

        if (btnPausar) {
            btnPausar.addEventListener('click', () => {
                recepcionPausada = !recepcionPausada;
                btnPausar.textContent = recepcionPausada
                    ? 'Reanudar Recepción'
                    : 'Pausar Recepción (Agenda Llena)';
                btnPausar.style.background = recepcionPausada ? 'var(--warning)' : '';

                if (bannerAgendaLlena) bannerAgendaLlena.classList.toggle('hidden', !recepcionPausada);

                citasHoyTbody.querySelectorAll('button').forEach(b => b.disabled = recepcionPausada);
            });
        }
    }

    // --- Perfil del Taller ---
    const btnGuardarPerfilTaller = document.getElementById('btn-guardar-perfil-taller');

    if (btnGuardarPerfilTaller) {
        const campos = ['perfil-nombre', 'perfil-direccion', 'perfil-telefono', 'perfil-horario', 'perfil-especialidad'];
        const guardado = JSON.parse(localStorage.getItem('tallerPerfil') || 'null');

        if (guardado) {
            campos.forEach(id => {
                const el = document.getElementById(id);
                if (el && guardado[id] !== undefined) el.value = guardado[id];
            });
        }

        btnGuardarPerfilTaller.addEventListener('click', () => {
            const data = {};
            campos.forEach(id => {
                const el = document.getElementById(id);
                if (el) data[id] = el.value;
            });
            localStorage.setItem('tallerPerfil', JSON.stringify(data));

            const userNameEl = document.getElementById('dashboard-user-name');
            if (userNameEl && data['perfil-nombre']) userNameEl.textContent = data['perfil-nombre'];

            const msg = document.getElementById('perfil-guardado-msg');
            if (msg) {
                msg.classList.remove('hidden');
                setTimeout(() => msg.classList.add('hidden'), 3000);
>>>>>>> 1d6b999 (TF1- archivos actualizados)
            }
        });
    }

<<<<<<< HEAD
    // --- LÓGICA DE MODAL DE EVIDENCIA (US-31) ---
    // Función global para abrir el modal desde la tabla del historial
    window.abrirEvidencia = function() {
        document.getElementById('modal-evidencia').classList.remove('hidden');
    };

=======
    /* ======================================================
       12. MODAL DE EVIDENCIA — función global
    ====================================================== */
    window.abrirEvidencia = function () {
        const modal = document.getElementById('modal-evidencia');
        if (modal) modal.classList.remove('hidden');
    };

    /* ======================================================
       13. Lógica del botón Desvincular Escáner
    ====================================================== */
    const btnDesvincular = document.getElementById('btn-desvincular');
    const contEscaner = document.getElementById('contenedor-escaner');
    
    if (btnDesvincular && contEscaner) {
        btnDesvincular.addEventListener('click', () => {
            if(confirm('¿Estás seguro de desvincular el escáner OBD-II de tu vehículo?')) {
                contEscaner.style.border = '1px solid var(--border-color)';
                contEscaner.innerHTML = '<p class="text-muted">No hay ningún dispositivo vinculado actualmente. Ingresa la MAC o busca dispositivos cercanos.</p>';
                alert('Escáner desconectado con éxito.');
            }
        });
    }

    /* ======================================================
       14. Lógica Menú Hamburguesa Móvil
    ====================================================== */
    const btnMenuMovil = document.getElementById('btn-menu-movil');
    const overlayMenu = document.getElementById('menu-movil-overlay');
    const cerrarMenu = document.getElementById('cerrar-menu-movil');

    if (btnMenuMovil && overlayMenu && cerrarMenu) {
        btnMenuMovil.addEventListener('click', () => overlayMenu.classList.remove('hidden'));
        cerrarMenu.addEventListener('click', () => overlayMenu.classList.add('hidden'));
    }

>>>>>>> 1d6b999 (TF1- archivos actualizados)
});