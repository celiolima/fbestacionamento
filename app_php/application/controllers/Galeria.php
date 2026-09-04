<?php

defined('BASEPATH') or exit('Ação não permitida');

class Galeria extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();

        if (!$this->ion_auth->logged_in()) {
            $this->session->set_flashdata('error', 'Sua sessão expirou!');
            redirect('login');
        }

        $this->load->model('core_model');
        $this->load->model('galeria_model');

        date_default_timezone_set('America/Sao_Paulo');
    }

    public function index()
    {
        $tipo = $this->input->get('tipo');
        $de = $this->input->get('data_inicial');
        $ate = $this->input->get('data_final');

        $where = array();

        if (!empty($de)) {
            $de_parts = explode('T', $de);
            if (count($de_parts) == 2) {
                $where['created_at >='] = $de_parts[0] . ' ' . $de_parts[1] . ':00';
            } else {
                $where['created_at >='] = $de . ' 00:00:00';
            }
        }

        if (!empty($ate)) {
            $ate_parts = explode('T', $ate);
            if (count($ate_parts) == 2) {
                $where['created_at <='] = $ate_parts[0] . ' ' . $ate_parts[1] . ':59';
            } else {
                $where['created_at <='] = $ate . ' 23:59:59';
            }
        }

        if (!empty($tipo)) {
            $where['type'] = $tipo;
        }

        $results = array();

        // Só realiza a consulta se pelo menos um filtro foi preenchido
        if (!empty($where)) {
            $results = $this->galeria_model->get_all('imagem_carro', $where);
        }

        $data = array(
            'titulo' => 'Você está na Galeria',
            'info_pagina_atual' => 'Bem vindo ao STE Park!',
            'pagina_atual' => 'Galeria',
            'icone_pagina' => 'ik-home',
            'styles' => array(
                'dist/css/galeria.css',
                'dist/css/home.css'
            ),
            'scripts' => array(
                'dist/js/galeria.js'
            ),
            'imagem_carro' => $results,
            'filtros' => array(
                'tipo' => $tipo,
                'data_inicial' => $de,
                'data_final' => $ate
            )
        );

        $this->load->view('layout/header', $data);
        $this->load->view('galeria/galeria');
        $this->load->view('layout/footer');
    }
}
