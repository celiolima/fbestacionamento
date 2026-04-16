// Correção para inicialização do PerfectScrollbar
$(document).ready(function () {
    // Verificar se os elementos existem antes de inicializar PerfectScrollbar
    var sidebarContent = document.querySelector(".sidebar-content");
    if (sidebarContent) {
        try {
            new PerfectScrollbar(sidebarContent, {
                wheelSpeed: 10,
                wheelPropagation: true,
                minScrollbarLength: 5
            });
        } catch (e) {
            console.warn("PerfectScrollbar não pôde ser inicializado para .sidebar-content:", e);
        }
    }

    var rightSidebar = document.querySelector(".right-sidebar");
    if (rightSidebar) {
        try {
            new PerfectScrollbar(rightSidebar, {
                wheelSpeed: 10,
                wheelPropagation: true,
                minScrollbarLength: 5
            });
        } catch (e) {
            console.warn("PerfectScrollbar não pôde ser inicializado para .right-sidebar:", e);
        }
    }

    var messages = document.querySelector(".messages");
    if (messages) {
        try {
            new PerfectScrollbar(messages, {
                wheelSpeed: 10,
                wheelPropagation: true,
                minScrollbarLength: 5
            });
        } catch (e) {
            console.warn("PerfectScrollbar não pôde ser inicializado para .messages:", e);
        }
    }
});