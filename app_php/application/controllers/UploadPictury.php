<?php

defined('BASEPATH') or exit('Ação não permitida');

class UploadPictury extends CI_Controller
{
    // Tamanho máximo permitido para upload: 5 MB
    const MAX_FILE_SIZE = 5 * 1024 * 1024;

    // Constantes para processamento de imagem
    const IMG_HEIGHT = 400;
    const IMG_QUALITY = 90;

    public function __construct()
    {
        parent::__construct();

        // 🔧 CORREÇÃO CORS: Adicionar headers de CORS NO CONSTRUTOR (antes de qualquer verificação)
        $this->_adicionar_cors_headers();

        // [CORRIGIDO] Autenticação reabilitada — rota estava pública
        if (!$this->ion_auth->logged_in()) {
            $this->_responder(false, 'Erro: não foi possível fazer o upload. Usuário não autenticado.');
            exit(); // ✅ CRÍTICO: Impede execução do index()
        }

        $this->load->model('core_model');
        date_default_timezone_set('America/Sao_Paulo');
    }

    public function index()
    {
        // [CORRIGIDO] Caminho físico no servidor em vez de base_url() HTTP
        $diretorioDestino = FCPATH . 'uploads' . DIRECTORY_SEPARATOR;
        $mensagem = '';
        $sucesso = false;

        if (!extension_loaded('gd')) {
            $mensagem = 'Erro: A extensão GD do PHP não está habilitada.';
            $this->_responder($sucesso, $mensagem);
            return;
        }

        // [ADICIONADO] Garante que o diretório de destino existe
        if (!is_dir($diretorioDestino)) {
            if (!mkdir($diretorioDestino, 0755, true)) {
                $mensagem = 'Erro: Não foi possível criar o diretório de uploads.';
                $this->_responder($sucesso, $mensagem);
                return;
            }
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['foto'])) {
            $arquivo = $_FILES['foto'];
            $headers = getallheaders();
            $authorization = $headers['Authorization'] ?? null;

            // ✅ SEGURANÇA: Sanitiza inputs vindos de headers para prevenir path traversal
            $type = preg_replace('/[^a-zA-Z0-9_-]/', '', $headers['type'] ?? 'unknown');
            $cam = preg_replace('/[^a-zA-Z0-9_-]/', '', $headers['cam'] ?? 'cam1');

            $insertDb = false; // ✅ Corrigido typo: insetDb → insertDb

            // [ADICIONADO] Verifica tamanho máximo do arquivo
            if ($arquivo['size'] > self::MAX_FILE_SIZE) {
                $mensagem = 'Erro: O arquivo excede o tamanho máximo permitido de 5 MB.';
                $this->_responder($sucesso, $mensagem);
                return;
            }

            if ($arquivo['error'] === UPLOAD_ERR_OK) {
                $finfo = new finfo(FILEINFO_MIME_TYPE);
                $tipoMime = $finfo->file($arquivo['tmp_name']);

                if ($tipoMime === 'image/jpeg') {
                    // ✅ Corrigido: ':' não é permitido em nomes de arquivo no Windows
                    $dataHora = date('d-m-Y_H-i-s');
                    $novoNome = $type . '_' . $cam . '_' . $dataHora . '.jpg';

                    // [CORRIGIDO] Caminho físico completo para salvar o arquivo
                    $caminhoFinal = $diretorioDestino . $novoNome;

                    $imgOriginal = imagecreatefromjpeg($arquivo['tmp_name']);

                    if (!$imgOriginal) {
                        $mensagem = 'Erro: Não foi possível processar a imagem.';
                        $this->_responder($sucesso, $mensagem);
                        return;
                    }

                    $larguraOriginal = imagesx($imgOriginal);
                    $alturaOriginal = imagesy($imgOriginal);

                    // ✅ Usa constantes ao invés de magic numbers
                    $novaAltura = self::IMG_HEIGHT;
                    $novaLargura = (int) floor($larguraOriginal * ($novaAltura / $alturaOriginal));

                    $imgRedimensionada = imagecreatetruecolor($novaLargura, $novaAltura);

                    imagecopyresampled(
                        $imgRedimensionada,
                        $imgOriginal,
                        0,
                        0,
                        0,
                        0,
                        $novaLargura,
                        $novaAltura,
                        $larguraOriginal,
                        $alturaOriginal
                    );

                    // ✅ Usa constante de qualidade
                    if (imagejpeg($imgRedimensionada, $caminhoFinal, self::IMG_QUALITY)) {
                        $insertDb = true;
                    } else {
                        $mensagem = 'Erro ao salvar a imagem no servidor.';
                    }

                    imagedestroy($imgOriginal);
                    imagedestroy($imgRedimensionada);
                } else {
                    $mensagem = 'Apenas arquivos JPEG são aceitos.';
                }
            } else {
                $mensagem = 'Erro no upload do arquivo (código: ' . $arquivo['error'] . ').';
            }

            // ✅ Corrigido typo e reativada validação de insert
            if ($insertDb) {
                // ✅ Removido carregamento redundante do model (já está no construtor)
                $data = array(
                    'name' => $novoNome,
                    'dirImage' => 'uploads/' . $novoNome, // ✅ Removido espaço após 'dirImage'
                    'type' => $type // ✅ Usa o $type sanitizado do header
                );

                // Executa insert
                $this->core_model->insert('imagem_carro', $data, true);

                // ✅ CRÍTICO: Verifica se insert funcionou através do affected_rows
                // O método insert() do Core_model não retorna valor, apenas define flashdata
                if ($this->db->affected_rows() > 0) {
                    $sucesso = true;
                    $mensagem = 'Sucesso! Foto salva, redimensionada e registrada no banco: ' . $novoNome;
                } else {
                    log_message('error', 'Falha ao inserir imagem no banco: ' . $novoNome . ' | Erro DB: ' . $this->db->error()['message']);
                    $sucesso = false;
                    $mensagem = 'Erro: Não foi possível salvar as informações no banco de dados.';
                }

                $this->_responder($sucesso, $mensagem);
                return;
            }
        } else {
            // Exibe formulário simples se não for POST
            $this->_exibir_formulario(); // Para testes manuais via navegador
            return;
        }

        // [CORRIGIDO] Retorna a resposta ao cliente
        $this->_responder($sucesso, $mensagem);
    }

    /**
     * Retorna a resposta como JSON (compatível com ESP32 e clientes web).
     */
    private function _responder($sucesso, $mensagem)
    {
        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'sucesso' => $sucesso,
                'mensagem' => $mensagem
            ]));
    }

    /**
     * Adiciona headers CORS para permitir requisições de diferentes origens
     */
    private function _adicionar_cors_headers()
    {
        // ✅ CRÍTICO: Corrigido headers CORS duplicados - valida origin dinamicamente
        $allowed_origins = [
            'http://localhost:8080',
            'https://fbjuaz.stesistemas.com'
        ];

        $origin = $_SERVER['HTTP_ORIGIN'] ?? '';

        if (in_array($origin, $allowed_origins)) {
            header('Access-Control-Allow-Origin: ' . $origin);
        }

        // Métodos HTTP permitidos
        header('Access-Control-Allow-Methods: GET, POST, OPTIONS');

        // Headers permitidos
        header('Access-Control-Allow-Headers: Content-Type, Authorization, type, cam');

        // Permite credenciais
        header('Access-Control-Allow-Credentials: true');

        // Tempo máximo de cache para preflight (24 horas)
        header('Access-Control-Max-Age: 86400');

        // Tratamento para requisições OPTIONS (preflight)
        if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
            http_response_code(200);
            exit();
        }
    }

    /**
     * Exibe um formulário HTML simples para testes manuais de upload.
     */
    private function _exibir_formulario()
    {
        echo '
            <!DOCTYPE html>
            <html lang="pt-BR">
            <head>
                <meta charset="UTF-8">
                <title>Upload de Foto</title>
            </head>
            <body>
                <h2>Upload de Foto (apenas JPEG, máx 5 MB)</h2>
                <form id="formFoto" enctype="multipart/form-data">
                    <input type="file" name="foto" accept="image/jpeg" required>
                    <button type="submit">Enviar</button>
                </form>

                <script>
                    document.getElementById("formFoto").addEventListener("submit", function(e) {
                        e.preventDefault();

                        const formData = new FormData(this);
                        
                        // ✅ Detecção automática de ambiente
                        const isLocalhost = window.location.hostname === "localhost" || window.location.hostname === "127.0.0.1";
                        const url = isLocalhost ? "/uploadPictury" : window.location.origin + "/uploadPictury";
                        
                        fetch(url, {
                            method: "POST",
                            headers: {
                                "Authorization": "Bearer token123",
                                "type": "entrada",
                                "cam": "cam1"
                            },
                            body: formData
                        })
                        .then(response => response.json())
                        .then(data => {
                            console.log("Resposta:", data);
                            alert(data.sucesso ? "✅ " + data.mensagem : "❌ " + data.mensagem);
                        })
                        .catch(error => {
                            console.error("Erro:", error);
                            alert("❌ Erro: " + error);
                        });
                    });
                </script>
            </body>
            </html>';
    }
}
