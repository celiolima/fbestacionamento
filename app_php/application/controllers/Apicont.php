<?php

defined('BASEPATH') or exit('Ação não permitida');

class Apicont extends CI_Controller
{
    // Tamanho máximo permitido para upload: 5 MB
    const MAX_FILE_SIZE = 5 * 1024 * 1024;

    public function __construct()
    {
        parent::__construct();

        // [CORRIGIDO] Autenticação reabilitada — rota estava pública
        if (!$this->ion_auth->logged_in()) {
            $this->_responder(true, 'Erro: efetue o login para acessar');
            return;
        }

        date_default_timezone_set('America/Sao_Paulo');
    }

    public function index()
    {       
        $mensagem = '';
        $sucesso = true;         

        // Define que a resposta será JSON
        header('Content-Type: application/json');

        // 1. Recebe a string JSON bruta
        $jsonBruto = file_get_contents('php://input');

        // 2. Decodifica o JSON para um array associativo PHP
        $dados = json_decode($jsonBruto, true);

        // 3. Verifica se o JSON é válido
        if ($dados === null) {
            $sucesso = false; 
            $mensagem = 'Erro: JSON inválido';
            $this->_responder($sucesso, $mensagem);
            return;               
        }

        // 4. Acessa os dados
        //$nome = $dados['nome'] ?? 'Não informado';
        $nome = $dados['nome'] ?? 'Não informado';       


        //$mensagem = 'Erro: nao foi possivel fazer o upload';
        $this->_responder($sucesso, $dados);
        return;
        

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

 
}
