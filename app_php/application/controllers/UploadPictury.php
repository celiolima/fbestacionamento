<?php

defined('BASEPATH') or exit('Ação não permitida');

class UploadPictury extends CI_Controller
{
    // Tamanho máximo permitido para upload: 5 MB
    const MAX_FILE_SIZE = 5 * 1024 * 1024;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('core_model');
        date_default_timezone_set('America/Sao_Paulo');

        // Checagem de token Bearer para IoT (Câmera ESP32-CAM)
        $headers = $this->input->request_headers();
        $auth_header = isset($headers['Authorization']) ? $headers['Authorization'] : '';

        $token_valido = false;

        if (strpos($auth_header, 'Bearer ') === 0) {
            $token = substr($auth_header, 7);
            // Verifica se o serial está cadastrado e ativo
            $dispositivo = $this->core_model->get_by_id('dispositivos', array('serial_dispositivo' => $token, 'status_dispositivo' => 1));
            if ($dispositivo) {
                $token_valido = true;
            }
        }

        // Se não houver token IoT válido, exige que um usuário admin esteja logado pela web (fallback)
        /* if (!$token_valido && !$this->ion_auth->logged_in()) {
            $this->output
                ->set_status_header(401)
                ->set_content_type('application/json')
                ->set_output(json_encode([
                    'sucesso' => false,
                    'mensagem' => 'Acesso negado: Token IoT ausente/invalido ou sessao web expirada.'
                ]));
            $this->output->_display();
            exit();
        } */
    }

    public function index()
    {
        // Caminho físico no servidor em vez de base_url() HTTP
        $diretorioDestino = FCPATH . 'public/uploads' . DIRECTORY_SEPARATOR;
        $mensagem = '';
        $sucesso = false;

        // Garante que o diretório de destino existe
        if (!is_dir($diretorioDestino)) {
            if (!mkdir($diretorioDestino, 0777, true)) {
                $mensagem = 'Erro: Não foi possível criar o diretório de uploads.';
                $this->_responder($sucesso, $mensagem);
                return;
            }
        }
        @chmod($diretorioDestino, 0777);

        $logPath = $diretorioDestino . 'debug_cam.log';
        $headers = function_exists('getallheaders') ? getallheaders() : [];
        $logMsg = "[" . date('Y-m-d H:i:s') . "] METHOD: " . $_SERVER['REQUEST_METHOD'] . " | FILES: " . implode(',', array_keys($_FILES)) . " | RAW LEN: " . strlen(file_get_contents('php://input')) . "\n";
        @file_put_contents($logPath, $logMsg, FILE_APPEND);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $arquivo = null;
            $is_raw = false;

            if (!empty($_FILES)) {
                $arquivo = reset($_FILES);
            } else {
                $rawBody = file_get_contents('php://input');
                if (!empty($rawBody)) {
                    $tmpPath = tempnam(sys_get_temp_dir(), 'cam_');
                    file_put_contents($tmpPath, $rawBody);
                    $arquivo = [
                        'name' => 'raw_image.jpg',
                        'type' => 'image/jpeg',
                        'tmp_name' => $tmpPath,
                        'error' => UPLOAD_ERR_OK,
                        'size' => strlen($rawBody)
                    ];
                    $is_raw = true;
                }
            }

            if ($arquivo) {
                $type = $headers['type'] ?? ($headers['Type'] ?? ($_SERVER['HTTP_TYPE'] ?? ($headers['X-Meu-Parametro'] ?? ($_SERVER['HTTP_X_MEU_PARAMETRO'] ?? ($_POST['type'] ?? 'entrada')))));
                $cam = $headers['cam'] ?? ($headers['Cam'] ?? ($headers['CAM'] ?? ($_SERVER['HTTP_CAM'] ?? ($_POST['cam'] ?? 'cam01'))));
                $insetDb = false;

                // Verifica tamanho máximo do arquivo
                if ($arquivo['size'] > self::MAX_FILE_SIZE) {
                    $mensagem = 'Erro: O arquivo excede o tamanho máximo permitido de 5 MB.';
                    $this->_responder($sucesso, $mensagem);
                    return;
                }

                if ($arquivo['error'] === UPLOAD_ERR_OK) {
                    $finfo = new finfo(FILEINFO_MIME_TYPE);
                    $tipoMime = $finfo->file($arquivo['tmp_name']);

                    // Validar se é realmente um JPEG sem carregar o GD inteiro
                    if ($tipoMime === 'image/jpeg' || $tipoMime === 'image/jpg' || $tipoMime === 'application/octet-stream') {
                        $dataHora = date('d-m-Y_H-i-s');
                        $novoNome = trim($type) . '_' . trim($cam) . '_' . $dataHora . '.jpg';
                        $caminhoFinal = $diretorioDestino . $novoNome;

                        // Salva diretamente o arquivo original, removendo o gargalo de redimensionamento do GD
                        $salvou = false;
                        if ($is_raw) {
                            $salvou = rename($arquivo['tmp_name'], $caminhoFinal);
                        } else {
                            $salvou = move_uploaded_file($arquivo['tmp_name'], $caminhoFinal);
                        }

                        if ($salvou) {
                            $insetDb = true;
                        } else {
                            $mensagem = 'Erro ao salvar a imagem no servidor (permissão ou disco).';
                        }
                    } else {
                        $mensagem = 'Apenas arquivos JPEG são aceitos.';
                    }
                } else {
                    $mensagem = 'Erro no upload do arquivo (código: ' . $arquivo['error'] . ').';
                }

                if ($insetDb) {
                    // Salva informações no banco de dados com a data/hora exata do Brasil
                    $data = array(
                        'name' => $novoNome,
                        'dirImage' => 'public/uploads/' . $novoNome,
                        'type' => $type,
                        'created_at' => date('Y-m-d H:i:s')
                    );

                    $insert = $this->core_model->insert('imagem_carro', $data, true);
                    $sucesso = true;
                    $mensagem = 'Sucesso! Foto salva direto no disco e registrada no banco: ' . $novoNome;
                    $this->_responder($sucesso, $mensagem);
                    return;
                }
            } else {
                $mensagem = 'Erro: Nenhum arquivo enviado no POST.';
            }
        } else {
            // Exibe apenas o formulário HTML limpo se não for POST
            $this->_exibir_formulario();
            return;
        }

        $this->_responder($sucesso, $mensagem);
    }

    private function _responder($sucesso, $mensagem)
    {
        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'sucesso' => $sucesso,
                'mensagem' => $mensagem
            ]));
    }

    private function _exibir_formulario()
    {
        echo '
            <!DOCTYPE html>
            <html lang="pt-BR">
            <head>
                <meta charset="UTF-8">
                <title>Upload de Foto - Teste</title>
                <style>
                    body { font-family: sans-serif; padding: 30px; }
                    form { max-width: 400px; padding: 20px; border: 1px solid #ccc; border-radius: 8px; }
                    label { display: block; margin-top: 10px; font-weight: bold; }
                    select, input[type="file"], button { width: 100%; margin-top: 5px; padding: 8px; }
                    button { background: #28a745; color: white; border: none; border-radius: 4px; margin-top: 15px; cursor: pointer; }
                </style>
            </head>
            <body>
                <h2>Upload Manual de Foto (JPEG)</h2>
                <form id="formFoto" method="POST" action="" enctype="multipart/form-data">
                    <label>Tipo (Entrada / Saída):</label>
                    <select name="type">
                        <option value="entrada">entrada</option>
                        <option value="saida">saida</option>
                    </select>
                    <label>Câmera:</label>
                    <select name="cam">
                        <option value="cam01">cam01</option>
                        <option value="cam02">cam02</option>
                    </select>
                    <label>Arquivo JPEG:</label>
                    <input type="file" name="foto" accept="image/jpeg" required>
                    <button type="submit">Enviar Foto</button>
                </form>
            </body>
            </html>';
    }
}
