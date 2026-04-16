<?php

defined('BASEPATH') or exit('Ação não permitida');

class Contador extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();

        if (!$this->ion_auth->logged_in()) {
            $this->session->set_flashdata('error', 'Sua sessão expirou!');
            redirect('login');
        }

        $this->load->model('core_model');
        //$this->load->model('home_model');
        //$this->load->model('estacionar_model');

        date_default_timezone_set('America/Sao_Paulo');
    }

    public function index()
    {
        /* echo "</pre>";
         print_r("  voçê esta na home");
         echo "</pre>";
         exit; */

        $data = array(
            'titulo' => 'Você está no Contador',
            'info_pagina_atual' => 'Bem vindo ao STE Park!',
            'pagina_atual' => 'Contador',
            'icone_pagina' => 'ik-home',
            'styles' => array(
                'dist/css/contador.css'
            ),
            'veiculos_qtd' => $this->core_model->get_ultimo_registro("veiculos_qtd")


        );

        /* echo '<pre>';
        print_r($data['veiculos_qtd']);
        exit(); */



        $this->load->view('layout/header', $data);
        $this->load->view('contador/contador');
        $this->load->view('layout/footer');
    }
}
