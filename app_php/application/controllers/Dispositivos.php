<?php

defined('BASEPATH') OR exit('Ação não permitida');

class Dispositivos extends CI_Controller {

    public function __construct() {
        parent::__construct();

        if (!$this->ion_auth->logged_in()) {
            $this->session->set_flashdata('error', 'Sua sessão expirou!');
            redirect('login');
        }

        $this->load->model('core_model');
        date_default_timezone_set('America/Sao_Paulo');
    }

    public function index() {

        if (!$this->ion_auth->is_admin()) {
            $this->session->set_flashdata('info', 'Você não tem permissão para acessar esse menu');
            redirect('home');
        }

        $data = array(
            'titulo' => 'Dispositivos IoT',
            'pagina_atual' => 'Dispositivos IoT',
            'info_pagina_atual' => 'Listando todos os dispositivos cadastrados',
            'icone_pagina' => 'fas fa-microchip',
            'styles' => array(
                'plugins/datatables/datatables.net-bs4/css/dataTables.bootstrap4.min.css'
            ),
            'scripts' => array(
                'plugins/datatables/datatables.net/js/jquery.dataTables.min.js',
                'plugins/datatables/datatables.net-bs4/js/dataTables.bootstrap4.min.js',
                'plugins/datatables/datatables.net-responsive/js/dataTables.responsive.min.js',
                'plugins/datatables/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js',
                'plugins/datatables/estacionamento.js',
            ),
            'dispositivos' => $this->core_model->get_all('dispositivos'),
        );

        $this->load->view('layout/header', $data);
        $this->load->view('dispositivos/listar');
        $this->load->view('layout/footer');
    }

    public function modulo($dispositivo_id = NULL) {

        if (!$dispositivo_id) {
            // Cadastra
            $this->form_validation->set_rules('nome_dispositivo', 'Nome', 'required');
            $this->form_validation->set_rules('serial_dispositivo', 'Serial', 'required|callback_check_serial_exists');
            $this->form_validation->set_rules('tipo_dispositivo', 'Tipo', 'required');
            $this->form_validation->set_rules('status_dispositivo', 'Status', 'required');

            if ($this->form_validation->run()) {

                $data = elements(
                        array(
                    'nome_dispositivo',
                    'serial_dispositivo',
                    'tipo_dispositivo',
                    'status_dispositivo'
                        ), $this->input->post()
                );

                $data = $this->security->xss_clean($data);

                $this->core_model->insert('dispositivos', $data);
                $this->session->set_flashdata('sucesso', 'Dados salvos com sucesso!');
                redirect($this->router->fetch_class());
            } else {
                $data = array(
                    'titulo' => 'Cadastrar Dispositivo IoT',
                    'pagina_atual' => 'Cadastrar Dispositivo',
                    'icone_pagina' => 'fas fa-microchip',
                    'texto_modal' => 'Tem certeza que deseja salvar o dispositivo?',
                    'styles' => array(
                        'plugins/select2/dist/css/select2.min.css',
                    ),
                    'scripts' => array(
                        'plugins/select2/dist/js/select2.min.js',
                    ),
                    'valor_btn' => 'Cadastrar'
                );

                $this->load->view('layout/header', $data);
                $this->load->view('dispositivos/modulo');
                $this->load->view('layout/footer');
            }
        } else {
            // Atualiza
            if (!$this->core_model->get_by_id('dispositivos', array('id' => $dispositivo_id))) {
                $this->session->set_flashdata('error', 'Dispositivo não encontrado');
                redirect($this->router->fetch_class());
            } else {

                $this->form_validation->set_rules('nome_dispositivo', 'Nome', 'required');
                $this->form_validation->set_rules('serial_dispositivo', 'Serial', 'required|callback_check_serial_exists');
                $this->form_validation->set_rules('tipo_dispositivo', 'Tipo', 'required');
                $this->form_validation->set_rules('status_dispositivo', 'Status', 'required');

                if ($this->form_validation->run()) {

                    $data = elements(
                            array(
                        'nome_dispositivo',
                        'serial_dispositivo',
                        'tipo_dispositivo',
                        'status_dispositivo'
                            ), $this->input->post()
                    );

                    $data = $this->security->xss_clean($data);

                    $this->core_model->update('dispositivos', $data, array('id' => $dispositivo_id));
                    $this->session->set_flashdata('sucesso', 'Dados atualizados com sucesso!');
                    redirect($this->router->fetch_class());
                } else {

                    $data = array(
                        'titulo' => 'Atualizar Dispositivo IoT',
                        'pagina_atual' => 'Atualizar Dispositivo',
                        'icone_pagina' => 'fas fa-microchip',
                        'texto_modal' => 'Os dados estão corretos?',
                        'styles' => array(
                            'plugins/select2/dist/css/select2.min.css',
                        ),
                        'scripts' => array(
                            'plugins/select2/dist/js/select2.min.js',
                        ),
                        'valor_btn' => 'Atualizar',
                        'dispositivo' => $this->core_model->get_by_id('dispositivos', array('id' => $dispositivo_id)),
                    );

                    $this->load->view('layout/header', $data);
                    $this->load->view('dispositivos/modulo');
                    $this->load->view('layout/footer');
                }
            }
        }
    }

    public function check_serial_exists($serial_dispositivo) {
        $dispositivo_id = $this->input->post('dispositivo_id');

        if ($this->core_model->get_by_id('dispositivos', array('serial_dispositivo' => $serial_dispositivo, 'id !=' => $dispositivo_id))) {
            $this->form_validation->set_message('check_serial_exists', 'Este serial já existe no banco de dados');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    public function del($dispositivo_id = NULL) {
        if (!$dispositivo_id || !$this->core_model->get_by_id('dispositivos', array('id' => $dispositivo_id))) {
            $this->session->set_flashdata('error', 'Dispositivo não encontrado');
            redirect($this->router->fetch_class());
        }

        $this->core_model->delete('dispositivos', array('id' => $dispositivo_id));
        redirect($this->router->fetch_class());
    }

}
