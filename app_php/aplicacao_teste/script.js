const form = document.getElementById('simulatorForm');
const btnSubmit = document.getElementById('btnSubmit');
const terminalOutput = document.getElementById('terminalOutput');
const fileInput = document.getElementById('foto');
const fileMsg = document.querySelector('.file-msg');

// UX: Mostrar nome do arquivo selecionado
fileInput.addEventListener('change', (e) => {
    if (e.target.files.length > 0) {
        fileMsg.textContent = e.target.files[0].name;
    } else {
        fileMsg.textContent = "Arraste uma imagem ou clique para selecionar";
    }
});

// UX: Drag and drop effects
const dropArea = document.querySelector('.file-drop-area');
['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, preventDefaults, false)
});
function preventDefaults (e) {
    e.preventDefault()
    e.stopPropagation()
}
['dragenter', 'dragover'].forEach(eventName => {
    dropArea.addEventListener(eventName, () => dropArea.classList.add('dragover'), false)
});
['dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, () => dropArea.classList.remove('dragover'), false)
});


// Lógica de Envio (Terminal Log)
function logToTerminal(type, message, json = null) {
    const time = new Date().toLocaleTimeString('pt-BR');
    
    const div = document.createElement('div');
    div.className = `log line-${type}`;
    
    const timeSpan = document.createElement('span');
    timeSpan.className = 'timestamp';
    timeSpan.textContent = `[${time}]`;
    
    const msgSpan = document.createElement('span');
    msgSpan.textContent = ` ${message}`;
    
    div.appendChild(timeSpan);
    div.appendChild(msgSpan);
    terminalOutput.appendChild(div);

    // Se houver JSON de retorno, printar formatado
    if (json) {
        const jsonDiv = document.createElement('div');
        jsonDiv.className = `log line-json`;
        jsonDiv.textContent = JSON.stringify(json, null, 2);
        terminalOutput.appendChild(jsonDiv);
    }

    // Auto-scroll para o final
    terminalOutput.scrollTop = terminalOutput.scrollHeight;
}


// Evento Principal de Disparo
form.addEventListener('submit', async (e) => {
    e.preventDefault();

    // Iniciar UI
    btnSubmit.classList.add('loading');
    btnSubmit.disabled = true;

    // Coletar Dados
    const url = document.getElementById('serverUrl').value;
    const token = document.getElementById('token').value;
    const type = document.getElementById('type').value;
    const cam = document.getElementById('cam').value;
    const file = fileInput.files[0];

    logToTerminal('info', `Iniciando disparo para ${url}`);
    logToTerminal('info', `Config: cam='${cam}', type='${type}', img='${file.name}'`);

    try {
        // Preparar FormData
        const formData = new FormData();
        formData.append('foto', file);
        formData.append('type', type);
        formData.append('cam', cam);

        // Disparar Fetch
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`
            },
            body: formData
        });

        // Tentar parsear o JSON de resposta
        let responseData = null;
        try {
            responseData = await response.json();
        } catch (err) {
            logToTerminal('warning', 'O servidor não retornou um JSON válido.');
        }

        if (response.ok) {
            logToTerminal('success', `HTTP ${response.status} - Sucesso!`, responseData);
        } else {
            logToTerminal('error', `HTTP ${response.status} - Falha na Requisição!`, responseData);
        }

    } catch (error) {
        logToTerminal('error', `Erro de Conexão (Network Error): ${error.message}`);
        logToTerminal('warning', 'Verifique se a API está online ou se o CORS está bloqueando.');
    } finally {
        // Restaurar UI
        btnSubmit.classList.remove('loading');
        btnSubmit.disabled = false;
    }
});
