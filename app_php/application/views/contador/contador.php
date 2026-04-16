<div class="main-content">
    <div class="container-fluid">

        <!-- PAGE HEADER -->
        <div class="page-header">
            <div class="row align-items-end">
                <div class="col-lg-8">
                    <div class="page-header-title">
                        <i class="ik <?php echo $icone_pagina ?> bg-blue"></i>
                        <h5><?php echo $pagina_atual ?></h5>
                        <span><?php echo $info_pagina_atual; ?></span>
                    </div>
                </div>
                <div class="col-lg-4">
                    <nav class="breadcrumb-container" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page"><?php echo $pagina_atual ?></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- FLASH MESSAGES -->
        <?php if ($message = $this->session->flashdata('info')): ?>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert bg-info alert-info text-black alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <span><i class="ik ik-alert-octagon"></i>&nbsp;&nbsp;<?php echo $message; ?></span>
                    </div>
                </div>
            </div>
        <?php endif; ?>

        <?php if ($message = $this->session->flashdata('sucesso')): ?>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert bg-success alert-success text-white alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <span><i class="fas fa-check-circle"></i>&nbsp;&nbsp;<?php echo $message; ?></span>
                    </div>
                </div>
            </div>
        <?php endif; ?>

        <!-- CARDS DE RESUMO -->
        <div class="row clearfix">

            <!-- Card: Carros Mês -->
            <div class="col-xl-3 col-md-6 col-sm-6 mb-4">
                <div class="card proj-t-card h-100">
                    <div class="card-body text-navy">
                        <div class="row align-items-center mb-30">
                            <div class="col-auto">
                                <i class="fas fa-car fa-2x text-gray-300"></i>
                            </div>
                            <div class="col pl-0">
                                <h6 class="mb-5 text-navy f-15">Carros Mês</h6>
                                <h6 class="mb-0 text-navy f-20"><?php echo $veiculos_qtd->total_carro_mes; ?></h6>
                            </div>
                        </div>
                        <div class="row align-items-center text-center">
                            <div class="col">
                                <h6 class="mb-0">--<span class="badge badge-pill bg-navy text-white"><?php /* echo $numero_total_vagas->total - $total_estacionados_agora; */ ?></span></h6>
                            </div>
                            <div class="col"><i class="fas fa-car fa-2x text-gray-300"></i></div>
                            <div class="col">
                                <h6 class="mb-0">--<span class="badge badge-pill bg-navy text-white"><?php /* echo $total_estacionados_agora; */ ?></span></h6>
                            </div>
                        </div>
                        <h6 class="pt-badge bg-navy small">STE Park</h6>
                    </div>
                </div>
            </div>

            <!-- Card: Motos Mês -->
            <div class="col-xl-3 col-md-6 col-sm-6 mb-4">
                <div class="card proj-t-card h-100">
                    <div class="card-body text-green">
                        <div class="row align-items-center mb-30">
                            <div class="col-auto">
                                <i class="fas fa-motorcycle fa-2x text-gray-300"></i>
                            </div>
                            <div class="col pl-0">
                                <h6 class="mb-5 f-15">Motos Mês</h6>
                                <h6 class="mb-0 text-green f-20"><?php echo $veiculos_qtd->total_moto_mes; ?></h6>
                            </div>
                        </div>
                        <div class="row align-items-center text-center">
                            <div class="col">
                                <h6 class="mb-0">--<span class="badge badge-pill bg-success text-white"><?php /* echo $total_mensalidades_receber; */ ?></span></h6>
                            </div>
                            <div class="col"><i class="fas fa-motorcycle fa-2x text-gray-300"></i></div>
                            <div class="col">
                                <h6 class="mb-0">-- <span class="badge badge-pill bg-success text-white"><?php /* echo $total_mensalidades_pagas; */ ?></span></h6>
                            </div>
                        </div>
                        <h6 class="pt-badge bg-green small">STEPark</h6>
                    </div>
                </div>
            </div>

            <!-- Card: Total de Carros -->
            <div class="col-xl-3 col-md-6 col-sm-6 mb-4">
                <div class="card proj-t-card h-100">
                    <div class="card-body text-navy">
                        <div class="row align-items-center mb-30">
                            <div class="col-auto">
                                <i class="fas fa-car fa-2x text-gray-300"></i>
                            </div>
                            <div class="col pl-0">
                                <h6 class="mb-5 text-navy f-15">Total de Carros</h6>
                                <h6 class="mb-0 text-navy f-20"><?php echo $veiculos_qtd->total_carro; ?></h6>
                            </div>
                        </div>
                        <div class="row align-items-center text-center">
                            <div class="col">
                                <h6 class="mb-0">--<span class="badge badge-pill bg-navy text-white"><?php /* echo $numero_total_vagas->total - $total_estacionados_agora; */ ?></span></h6>
                            </div>
                            <div class="col"><i class="fas fa-car fa-2x text-gray-300"></i></div>
                            <div class="col">
                                <h6 class="mb-0">--<span class="badge badge-pill bg-navy text-white"><?php /* echo $total_estacionados_agora; */ ?></span></h6>
                            </div>
                        </div>
                        <h6 class="pt-badge bg-navy small">STE Park</h6>
                    </div>
                </div>
            </div>

            <!-- Card: Total de Motos -->
            <div class="col-xl-3 col-md-6 col-sm-6 mb-4">
                <div class="card proj-t-card h-100">
                    <div class="card-body text-green">
                        <div class="row align-items-center mb-30">
                            <div class="col-auto">
                                <i class="fas fa-motorcycle fa-2x text-gray-300"></i>
                            </div>
                            <div class="col pl-0">
                                <h6 class="mb-5 f-15">Total de Motos</h6>
                                <h6 class="mb-0 text-green f-20"><?php echo $veiculos_qtd->total_moto; ?></h6>
                            </div>
                        </div>
                        <div class="row align-items-center text-center">
                            <div class="col">
                                <h6 class="mb-0">-- <span class="badge badge-pill bg-success text-white"><?php /* echo $total_mensalidades_receber; */ ?></span></h6>
                            </div>
                            <div class="col"><i class="fas fa-motorcycle fa-2x text-gray-300"></i></div>
                            <div class="col">
                                <h6 class="mb-0">-- <span class="badge badge-pill bg-success text-white"><?php /* echo $total_mensalidades_pagas; */ ?></span></h6>
                            </div>
                        </div>
                        <h6 class="pt-badge bg-green small">STEPark</h6>
                    </div>
                </div>
            </div>

        </div><!-- /row resumo -->

        <!-- PAINEL PRINCIPAL: Contador + Vagas -->
        <div class="row">

            <!-- COLUNA ESQUERDA: Contadores Carros/Motos -->
            <div class="col-lg-6 col-md-12 mb-4">
                <div class="card h-100">
                    <div class="card-header d-block text-center">
                        <h5 class="text-uppercase h6">CONTADOR REAL TIME</h5>
                    </div>
                    <div class="card-body">

                        <!-- CARROS -->
                        <div class="card border-left-primary shadow mb-3 py-2">
                            <div class="card-body">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-2">
                                    <i class="fas fa-car fa-2x text-gray-300"></i>
                                    <h5>CARROS</h5>
                                </div>
                                <div class="contador-row">
                                    <div class="bt00e">
                                        <p class="mostEsq">ENTRADA:</p>
                                    </div>
                                    <div class="bt00d">
                                        <p id="ecar" class="mostDir"><?php echo $veiculos_qtd->total_carro_entrada; ?></p>
                                    </div>
                                </div>
                                <div class="contador-row">
                                    <div class="bt00e">
                                        <p class="mostEsq">SAÍDA:</p>
                                    </div>
                                    <div class="bt00d">
                                        <p id="scar" class="mostDir"><?php echo $veiculos_qtd->total_carro_saida; ?></p>
                                    </div>
                                </div>
                                <div class="contador-row">
                                    <div class="bt00e">
                                        <p class="mostEsq">PÁTIO:</p>
                                    </div>
                                    <div class="bt00d">
                                        <p id="pcar" class="mostDir"><?php echo (int)$veiculos_qtd->total_carro_entrada - (int)$veiculos_qtd->total_carro_saida; ?></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- MOTOS -->
                        <div class="card border-left-primary shadow py-2">
                            <div class="card-body">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-2">
                                    <i class="fas fa-motorcycle fa-2x text-gray-300"></i>
                                    <h5>MOTOS</h5>
                                </div>
                                <div class="contador-row">
                                    <div class="bt00e">
                                        <p class="mostEsq">ENTRADA:</p>
                                    </div>
                                    <div class="bt00d">
                                        <p id="emot" class="mostDir"><?php echo $veiculos_qtd->total_moto_entrada; ?></p>
                                    </div>
                                </div>
                                <div class="contador-row">
                                    <div class="bt00e">
                                        <p class="mostEsq">SAÍDA:</p>
                                    </div>
                                    <div class="bt00d">
                                        <p id="smot" class="mostDir"><?php echo $veiculos_qtd->total_moto_saida; ?></p>
                                    </div>
                                </div>
                                <div class="contador-row">
                                    <div class="bt00e">
                                        <p class="mostEsq">PÁTIO:</p>
                                    </div>
                                    <div class="bt00d">
                                        <p id="pmot" class="mostDir"><?php echo (int)$veiculos_qtd->total_moto_entrada - (int)$veiculos_qtd->total_moto_saida; ?></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- COLUNA DIREITA: Mapa de Vagas -->
            <div class="col-lg-6 col-md-12 mb-4">
                <div class="card h-100">
                    <div class="card-header d-block text-center">
                        <h5 class="text-uppercase h6">Futuro</h5>
                    </div>
                    <div class="card-body">

                    </div>
                </div>
            </div>

        </div><!-- /row principal -->

    </div>
</div>