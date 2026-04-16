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
            $sucesso = false;
            $mensagem = 'Erro: User não autenticado';
            $this->_responder($sucesso, $mensagem);
            return;
        }
        $this->load->model('core_model');

        date_default_timezone_set('America/Sao_Paulo');
    }

    public function index()
    {
        $mensagem = '';
        $sucesso = true;
        //postimamente, o ESP32 enviará um JSON com os seguintes campos:
        /* {
        "entrada_carro": 24,
        "saida_carro": 8,
        "entrada_moto": 15,
        "saida_moto": 12
        } */

        // Define que a resposta será JSON
        header('Content-Type: application/json');

        // 1. Recebe a string JSON bruta
        $jsonBruto = file_get_contents('php://input');
        // 2. Decodifica o JSON para um array associativo PHP
        $dados = json_decode($jsonBruto, true);

        $qtd_veicucols = $this->core_model->get_all('veiculos_qtd');
        // 4. Acessa os dados       
        $entrada_carro = $dados['entrada_carro'] ?? $qtd_veicucols[0]->total_carro_entrada;
        $saida_carro = $dados['saida_carro'] ?? $qtd_veicucols[0]->total_carro_saida;
        $entrada_moto = $dados['entrada_moto'] ?? $qtd_veicucols[0]->total_moto_entrada;
        $saida_moto = $dados['saida_moto'] ?? $qtd_veicucols[0]->total_moto_saida;
        $total_carro_mes = $qtd_veicucols[0]->total_carro_mes;
        $total_moto_mes = $qtd_veicucols[0]->total_moto_mes;
        $total_carro = $qtd_veicucols[0]->total_carro;
        $total_moto = $qtd_veicucols[0]->total_moto;

        if ($entrada_carro < $qtd_veicucols[0]->total_carro_entrada || $entrada_moto < $qtd_veicucols[0]->total_moto_entrada) {
            $data = array(
                'total_carro_entrada' => $dados['entrada_carro'],
                'total_carro_saida' => $dados['saida_carro'],
                'total_moto_entrada' => $dados['entrada_moto'],
                'total_moto_saida' => $dados['saida_moto'],
                'total_carro_mes' => $total_carro_mes + $dados['entrada_carro'],
                'total_moto_mes' => $total_moto_mes + $dados['entrada_moto'],
                'total_carro' => $total_carro + $dados['entrada_carro'],
                'total_moto' => $total_moto + $dados['entrada_moto']
            );

            // Atualiza o banco de dados com os novos totais
            $data = $this->security->xss_clean($data);
            $this->core_model->update('veiculos_qtd', $data, array('id' => 1));

            $sucesso = true;
            $mensagem = 'Dados atualizados com sucesso';
            $this->_responder($sucesso, $dados);
            return;
        }


        if (date('d') == '01') {
            // mudou o mês
            $total_carro_mes = 0;
            $total_moto_mes = 0;

            if ($entrada_carro != $qtd_veicucols[0]->total_carro_entrada) {
                $total_carro_mes = $total_carro_mes + ($entrada_carro - $qtd_veicucols[0]->total_carro_entrada);
            } else {
                $total_carro_mes = $total_carro_mes;
            }

            if ($entrada_moto != $qtd_veicucols[0]->total_moto_entrada) {
                $total_moto_mes = $total_moto_mes + ($entrada_moto - $qtd_veicucols[0]->total_moto_entrada);
            } else {
                $total_moto_mes = $total_moto_mes;
            }
        } else {
            // mesmo mês, apenas atualiza os totais
            if ($entrada_carro != $qtd_veicucols[0]->total_carro_entrada) {
                $total_carro_mes = $qtd_veicucols[0]->total_carro_mes + ($entrada_carro - $qtd_veicucols[0]->total_carro_entrada);
            } else {
                $total_carro_mes = $qtd_veicucols[0]->total_carro_mes;
            }

            if ($entrada_moto != $qtd_veicucols[0]->total_moto_entrada) {
                $total_moto_mes = $qtd_veicucols[0]->total_moto_mes + ($entrada_moto - $qtd_veicucols[0]->total_moto_entrada);
            } else {
                $total_moto_mes = $qtd_veicucols[0]->total_moto_mes;
            }
        }

        if ($entrada_carro != $qtd_veicucols[0]->total_carro_entrada) {
            $total_carro = $qtd_veicucols[0]->total_carro + ($entrada_carro - $qtd_veicucols[0]->total_carro_entrada);
        } else {
            $total_carro = $qtd_veicucols[0]->total_carro;
        }

        if ($entrada_moto != $qtd_veicucols[0]->total_moto_entrada) {
            $total_moto = $qtd_veicucols[0]->total_moto + ($entrada_moto - $qtd_veicucols[0]->total_moto_entrada);
        } else {
            $total_moto = $qtd_veicucols[0]->total_moto;
        }

        // 3. Verifica se o JSON é válido
        if ($dados === null) {
            $sucesso = false;
            $mensagem = 'Erro: JSON inválido';
            $this->_responder($sucesso, $mensagem);
            return;
        } else {
            $data = array(
                'total_carro_entrada' => $entrada_carro,
                'total_carro_saida' => $saida_carro,
                'total_moto_entrada' => $entrada_moto,
                'total_moto_saida' => $saida_moto,
                'total_carro_mes' => $total_carro_mes,
                'total_moto_mes' => $total_moto_mes,
                'total_carro' => $total_carro,
                'total_moto' => $total_moto
            );


            // Atualiza o banco de dados com os novos totais
            $data = $this->security->xss_clean($data);
            $this->core_model->update('veiculos_qtd', $data, array('id' => 1));

            $sucesso = true;
            $mensagem = 'Dados atualizados com sucesso';
            $this->_responder($sucesso, $dados);
            return;
        }
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
