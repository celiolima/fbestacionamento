<?php

defined('BASEPATH') or exit('Ação não permitida');

class UploadPictury extends CI_Controller
{
    // Tamanho máximo permitido para upload: 5 MB
    const MAX_FILE_SIZE = 5 * 1024 * 1024;

    public function __construct()
    {
        parent::__construct();

        // [CORRIGIDO] Autenticação reabilitada — rota estava pública
        if (!$this->ion_auth->logged_in()) {
            $this->_responder(true, 'Erro: nao foi possivel fazer o upload');
            return;
        }

        date_default_timezone_set('America/Sao_Paulo');
    }

    public function index()
    {
        // [CORRIGIDO] Caminho físico no servidor em vez de base_url() HTTP
        $diretorioDestino = FCPATH . 'public/uploads' . DIRECTORY_SEPARATOR;
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

                    $dataHora = date('Y-m-d_H-i-s');
                    $novoNome = $dataHora . '_' . bin2hex(random_bytes(8)) . '.jpg';

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

                    $novaAltura = 400;
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

                    if (imagejpeg($imgRedimensionada, $caminhoFinal, 90)) {
                        $sucesso = true;
                        $mensagem = 'Sucesso! Foto salva e redimensionada: ' . $novoNome;
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
        } else {
            // [ADICIONADO] Exibe formulário simples se não for POST

            $mensagem = 'Erro: nao foi possivel fazer o upload';
            $this->_responder($sucesso, $mensagem);

            //$this->_exibir_formulario(); // Para testes manuais via navegador
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
     * Exibe um formulário HTML simples para testes manuais de upload.
     */
    private function _exibir_formulario()
    {
        echo '<!DOCTYPE html>
                <html lang="pt-BR">
                <head><meta charset="UTF-8"><title>Upload de Foto</title></head>
                <body>
                <h2>Upload de Foto (apenas JPEG, máx 5 MB)</h2>
                <form method="POST" enctype="multipart/form-data">
                    <input type="file" name="foto" accept="image/jpeg" required>
                    <button type="submit">Enviar</button>
                </form>
                </body>
                </html>';
    }
}
