
// Selecionar todos os checkboxes
function toggleTodos(source) {
    document.querySelectorAll('.foto-check').forEach(cb => cb.checked = source.checked);
}

// Funções do Lightbox
function abrirLightbox(src) {
    console.log('abrirLightbox chamada com:', src);
    const lb = document.getElementById('lightbox');
    const lbImg = document.getElementById('img-lightbox');

    console.log('Elemento lightbox:', lb);
    console.log('Elemento img-lightbox:', lbImg);

    if (lb && lbImg) {
        lbImg.src = src; // Define a imagem clicada como fonte
        lb.style.display = 'flex'; // Exibe o container
        console.log('Lightbox aberto com sucesso');
    } else {
        console.error('Elementos do lightbox não encontrados');
        console.log('lightbox element:', lb);
        console.log('img-lightbox element:', lbImg);
    }
}

function fecharLightbox() {
    const lb = document.getElementById('lightbox');
    if (lb) {
        lb.style.display = 'none';
    }
}

// Fechar ao apertar a tecla ESC
document.addEventListener('keydown', (e) => {
    if (e.key === "Escape") fecharLightbox();
});

// Debug: verificar se elementos existem quando página carrega
document.addEventListener('DOMContentLoaded', function () {
    console.log('DOM carregado - verificando elementos:');
    console.log('lightbox:', document.getElementById('lightbox'));
    console.log('img-lightbox:', document.getElementById('img-lightbox'));
});
