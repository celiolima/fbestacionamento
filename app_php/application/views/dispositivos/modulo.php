<div class="main-content">
    <div class="container-fluid">

        <div class="page-header">
            <div class="row align-items-end">
                <div class="col-lg-8">
                    <div class="page-header-title">
                        <i class="<?php echo $icone_pagina ?> bg-blue"></i>
                    </div>
                </div>
                <div class="col-lg-4">
                    <nav class="breadcrumb-container" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a title="Home" href="<?php echo base_url('home'); ?>"><i class="ik ik-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">
                                <a title="Dispositivos" href="<?php echo base_url('dispositivos'); ?>">Dispositivos</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page"><?php echo $pagina_atual ?></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <?php if ($message = $this->session->flashdata('error')): ?>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert bg-danger alert-danger text-white alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" style="color: black !important">&times;</button>
                        <span><i class="fas fa-skull-crossbones"></i>&nbsp;&nbsp;<?php echo $message; ?></span>
                    </div>
                </div>
            </div>
        <?php endif; ?>

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3><?php echo $titulo; ?></h3>
                    </div>
                    <div class="card-body">

                        <?php if (isset($dispositivo)): ?>
                            <p class="text-muted small mb-4"><i class="ik ik-edit-1 ik-2x">&nbsp;&nbsp;</i>Última atualização:&nbsp;&nbsp;</i><?php echo date('d/m/Y H:i:s', strtotime($dispositivo->data_alteracao)); ?></p>
                        <?php endif; ?>

                        <form class="forms-sample" name="form_modulo" method="post">

                            <div class="row mb-3">
                                <div class="col-md-6 mb-3">
                                    <label for="nome_dispositivo">Nome do Dispositivo</label>
                                    <input type="text" class="form-control" name="nome_dispositivo" value="<?php echo (isset($dispositivo) ? $dispositivo->nome_dispositivo : set_value('nome_dispositivo')) ?>">
                                    <?php echo form_error('nome_dispositivo', '<div class="text-danger">', '</div>') ?>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="serial_dispositivo">Serial Token (MAC/ChipID)</label>
                                    <input type="text" class="form-control" name="serial_dispositivo" value="<?php echo (isset($dispositivo) ? $dispositivo->serial_dispositivo : set_value('serial_dispositivo')) ?>">
                                    <?php echo form_error('serial_dispositivo', '<div class="text-danger">', '</div>') ?>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6 mb-3">
                                    <label for="tipo_dispositivo">Tipo de Dispositivo</label>
                                    <select class="form-control" name="tipo_dispositivo">
                                        <?php if (isset($dispositivo)): ?>
                                            <option value="Camera" <?php echo ($dispositivo->tipo_dispositivo == 'Camera' ? 'selected' : '') ?>>Câmera</option>
                                            <option value="Central" <?php echo ($dispositivo->tipo_dispositivo == 'Central' ? 'selected' : '') ?>>Central</option>
                                        <?php else: ?>
                                            <option value="Camera">Câmera</option>
                                            <option value="Central">Central</option>
                                        <?php endif; ?>
                                    </select>
                                    <?php echo form_error('tipo_dispositivo', '<div class="text-danger">', '</div>') ?>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="status_dispositivo">Status</label>
                                    <select class="form-control" name="status_dispositivo">
                                        <?php if (isset($dispositivo)): ?>
                                            <option value="1" <?php echo ($dispositivo->status_dispositivo == 1 ? 'selected' : '') ?>>Ativo</option>
                                            <option value="0" <?php echo ($dispositivo->status_dispositivo == 0 ? 'selected' : '') ?>>Inativo</option>
                                        <?php else: ?>
                                            <option value="1">Ativo</option>
                                            <option value="0">Inativo</option>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>

                            <?php if (isset($dispositivo)): ?>
                                <input type="hidden" name="dispositivo_id" value="<?php echo $dispositivo->id ?>"/>
                            <?php endif; ?>

                            <a title="<?php echo $valor_btn ?>" href="javascript:void(0)" class="btn btn-primary mr-2" data-toggle="modal" data-target="#dispositivoModal"><?php echo $valor_btn ?></a>                            
                            <a href="<?php echo base_url($this->router->fetch_class()); ?>" class="btn btn-light">Voltar</a>

                            <div class="modal fade" id="dispositivoModal" tabindex="-1" role="dialog" aria-labelledby="demoModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="demoModalLabel"><i class="ik ik-alert-octagon text-danger"></i>&nbsp;&nbsp;Confirmação de dados!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        </div>
                                        <div class="modal-body">
                                            <span class="text-dark font-weight-bold"><?php echo $texto_modal; ?></span></br>
                                            <p></p>
                                            Clique em <span class="text-primary font-weight-bold">"Sim"</span> para <?php echo $valor_btn ?>.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-success" data-dismiss="modal">Não</button>
                                            <button type="submit" class="btn btn-primary mr-2" value="">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
