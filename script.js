document.addEventListener("DOMContentLoaded", function() {
    
    // 1. Lógica del Simulador OBD-II
    const form = document.getElementById("diagnostic-form");
    const obdInput = document.getElementById("obd-code");
    const spinner = document.getElementById("loading-spinner");
    const resultBox = document.getElementById("diagnostic-result");
    const resultDesc = document.getElementById("result-desc");
    const resultAction = document.getElementById("result-action");

    form.addEventListener("submit", function(event) {
        event.preventDefault();
        const code = obdInput.value.trim().toUpperCase();
        if(!code) return;

        form.classList.add("hidden");
        resultBox.classList.add("hidden");
        spinner.classList.remove("hidden");

        setTimeout(() => {
            spinner.classList.add("hidden");
            
            let falla = "Anomalía detectada en los sensores base.";
            let recomendacion = "Agendar revisión general pronto.";

            if(code.includes("P0300")) {
                falla = "Falla múltiple en cilindros (Misfire).";
                recomendacion = "Revisar bujías, bobinas e inyectores urgente.";
            } else if (code.includes("P0171")) {
                falla = "Sistema demasiado pobre (Banco 1).";
                recomendacion = "Revisar sensor MAF o posibles fugas de vacío.";
            }

            document.getElementById("result-title").innerHTML = `Diagnóstico: <strong>${code}</strong>`;
            resultDesc.innerHTML = `<strong>Predicción:</strong> ${falla}`;
            resultAction.innerHTML = `<strong>Recomendación:</strong> ${recomendacion}`;
            
            resultBox.classList.remove("hidden");
            form.classList.remove("hidden");
            obdInput.value = ""; 
        }, 2500); 
    });

    // 2. Lógica del Chatbot
    const chatToggle = document.getElementById("chat-toggle");
    const chatWindow = document.getElementById("chat-window");
    const closeChat = document.getElementById("close-chat");
    const chatForm = document.getElementById("chat-form");
    const chatInput = document.getElementById("chat-input");
    const chatMessages = document.getElementById("chat-messages");

    chatToggle.addEventListener("click", () => chatWindow.classList.toggle("hidden"));
    closeChat.addEventListener("click", () => chatWindow.classList.add("hidden"));

    chatForm.addEventListener("submit", (e) => {
        e.preventDefault();
        const text = chatInput.value.trim();
        if(!text) return;

        addMessage(text, "user");
        chatInput.value = "";

        setTimeout(() => {
            let reply = "Entiendo. Te sugiero iniciar sesión en el Dashboard para conectar tu escáner OBD-II.";
            let lowerText = text.toLowerCase();
            
            if(lowerText.includes("frena") || lowerText.includes("vibra")) {
                reply = "Esa vibración suele indicar discos de freno alabeados. Sugiero revisión del eje delantero.";
            } else if (lowerText.includes("aceite")) {
                reply = "No olvides que el cambio de aceite sintético se recomienda cada 10,000 km.";
            }
            addMessage(reply, "bot");
        }, 1000);
    });

    function addMessage(text, sender) {
        const msg = document.createElement("div");
        msg.classList.add("message", sender);
        msg.textContent = text;
        chatMessages.appendChild(msg);
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }
});