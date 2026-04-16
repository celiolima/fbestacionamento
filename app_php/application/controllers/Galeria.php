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


        if ($this->input->get() !== null && count($this->input->get()) > 0) {

            $tipo = $this->input->get('tipo');
            $de = $this->input->get('data_inicial');
            $ate = $this->input->get('data_final');
            if ($de) {
                $de = explode('T', $de);
                $de = $de[0] . ' ' . $de[1] . ':00';
            }
            if ($ate) {
                $ate = explode('T', $ate);
                $ate = $ate[0] . ' ' . $ate[1] . ':00';
            }
            if (empty($tipo)) {
                $where = array(
                    'created_at >=' => $de,
                    'created_at <=' => $ate

                );
            } else {
                $where = array(
                    'created_at >=' => $de,
                    'created_at <=' => $ate,
                    'type'          => $tipo
                );
            }
            $data = array(
                'titulo' => 'Você está na Galeria',
                'info_pagina_atual' => 'Bem vindo ao STE Park!',
                'pagina_atual' => 'Galeria',
                'icone_pagina' => 'ik-home',
                //'exclude_theme_js' => true, // Excluir theme.js na galeria para evitar erro do PerfectScrollbar
                'styles' => array(
                    'dist/css/galeria.css',
                    'dist/css/home.css'
                ),
                'scripts' => array(
                    'dist/js/galeria.js'
                ),
                'imagem_carro' => $this->galeria_model->get_all('imagem_carro',  $where),
                'filtros' => $this->input->get()

            );
            /*  echo '<pre>';
            print_r($data);
            echo '</pre>';
            exit(); */
            $this->load->view('layout/header', $data);
            $this->load->view('galeria/galeria');
            $this->load->view('layout/footer');
            return;
        }

        $data = array(
            'titulo' => 'Você está na Galeria',
            'info_pagina_atual' => 'Bem vindo ao STE Park!',
            'pagina_atual' => 'Galeria',
            'icone_pagina' => 'ik-home',
            //'exclude_theme_js' => true, // Excluir theme.js na galeria para evitar erro do PerfectScrollbar
            'styles' => array(
                'dist/css/galeria.css',
                'dist/css/home.css'
            ),
            'scripts' => array(
                'dist/js/galeria.js'
            ),
            'imagem_carro' => $this->core_model->get_all('imagem_carro')

        );
        /* echo '<pre>';
        print_r($data['imagem_carro']);
        echo '</pre>';
        exit(); */

        $this->load->view('layout/header', $data);
        $this->load->view('galeria/galeria');
        $this->load->view('layout/footer');
    }
}
