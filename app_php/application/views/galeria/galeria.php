<?php
$diretorio = 'public/uploads/';
$mensagem = "";

// Lógica de Exclusão Múltipla
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['excluir_selecionados'])) {

    $this->load->model('core_model');

    if (!empty($_POST['fotos_para_excluir'])) {
        $contagem = 0;
        $diretorioReal = realpath($diretorio);
        foreach ($_POST['fotos_para_excluir'] as $idFoto) {
            $Foto = $this->core_model->get_by_id('imagem_carro', array('id' => $idFoto));  // Busca a foto no banco de dados         
            $this->core_model->delete('imagem_carro', array('id' => $idFoto)); // Exclui a foto do banco de dados

            $nomeFoto = $Foto->name;
            $caminhoCompleto = realpath($diretorio . basename($nomeFoto));
            if ($caminhoCompleto && strpos($caminhoCompleto, $diretorioReal) === 0 && file_exists($caminhoCompleto)) {
                unlink($caminhoCompleto);
                $contagem++;
            }
        }
        $mensagem = "Sucesso: $contagem foto(s) excluída(s).";
        redirect(current_url());
    }
}

$arquivos = glob($diretorio . "*.{jpg,jpeg,JPG,JPEG}", GLOB_BRACE);
if ($arquivos)
    array_multisort(array_map('filemtime', $arquivos), SORT_DESC, $arquivos);
?>

<div class="main-content">
    <div class="container-fluid">

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

        <?php
        if ($message = $this->session->flashdata('info')):
        ?>

            <div class="row">
                <div class="col-md-12">
                    <div class="alert bg-info alert-info text-black alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <span><i class="ik ik-alert-octagon"></i>&nbsp;&nbsp;<?php echo $message; ?></span>
                    </div>
                </div>
            </div>

        <?php endif; ?>
        <div class="card-body">

            <?php
            if ($message = $this->session->flashdata('sucesso')):
            ?>

                <div class="row">
                    <div class="col-md-12">
                        <div class="alert bg-success alert-success text-white alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <span><i class="fas fa-check-circle"></i>&nbsp;&nbsp;<?php echo $message; ?></span>
                        </div>
                    </div>
                </div>

            <?php endif; ?>
            <?php
            /* echo "<pre>";
            print_r(base_url());
            echo "</pre>";
            exit; */
            ?>




            <div class="row clearfix">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="container">

                                    <?php if ($mensagem) echo "<p><strong>$mensagem</strong></p>"; ?>
                                    <!--   //Formulario header -->

                                    <form class="form-inline mb-12" method="get" action="<?php echo base_url();  ?>galeria">

                                        <div class="form-group mb-3 mr-3">
                                            <label for="tipo">Sentido</label>
                                            <select class="form-control" name="tipo" id="tipo" value="">
                                                <option value="">Todos</option>
                                                <option value="entrada" <?= $this->input->get('tipo') == "entrada" ? "selected" : ""; ?>>Entrada</option>
                                                <option value="saida" <?= $this->input->get('tipo') == "saida" ? "selected" : ""; ?>>Saida</option>
                                            </select>
                                        </div>

                                        <div class="form-group mb-3 mr-3">
                                            <label for="data_inicial">Data Inicial</label>
                                            <input class="form-control" type="datetime-local" name="data_inicial" autocomplete="off" id="data" placeholder="Data Inicial" value="<?= $this->input->get('data_inicial') ? $this->input->get('data_inicial') : date('Y-m-d\TH:i') ?>">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="data_final">Data Final</label>
                                            <input class="form-control" type="datetime-local" name="data_final" autocomplete="off" id="data2" placeholder="Data Final" value="<?= $this->input->get('data_final') ? $this->input->get('data_final') : date('Y-m-d\TH:i') ?>">
                                        </div>
                                        <div class="form-group mb-3 ml-3">
                                            <button class="button btn btn-mini btn-warning">
                                                <span class="button__icon"><i class='bx bx-search-alt'></i></span>
                                                <span class="button__text2">Pesquisar</span>
                                            </button>
                                            <a href="<?php echo base_url();  ?>galeria" class="button btn btn-mini btn-success" style="max-width: 140px">
                                                <span class="button__icon"><i class='bx bx-plus-circle'></i></span><span class="button__text2">Limpa</span></a>
                                        </div>
                                    </form>
                                    <!-- //fim formilario header -->

                                    <form method="POST">
                                        <?php if ($this->ion_auth->is_admin()): ?>
                                            <div class="controles">
                                                <label><input type="checkbox" onclick="toggleTodos(this)"> Selecionar Todos</label>
                                                <button type="submit" name="excluir_selecionados" class="btn-excluir" onclick="return confirm('Excluir selecionados?')">Excluir</button>
                                            </div>
                                        <?php endif; ?>

                                        <div class="galeria">
                                            <?php if ($imagem_carro):
                                                foreach ($imagem_carro as $foto):
                                                    $nome = basename($foto->name); ?>
                                                    <div class="card">
                                                        <?php if ($this->ion_auth->is_admin()): ?><input type="checkbox" name="fotos_para_excluir[]" value="<?php echo $foto->id; ?>" class="foto-check checkbox-container "><?php endif; ?>
                                                        <img src="<?php echo $foto->dirImage; ?>" alt="Foto" onclick="abrirLightbox('<?php echo $foto->dirImage; ?>')">
                                                        <div class="card-body">
                                                            <p class="card-text"><?php echo $nome; ?></p>
                                                        </div>
                                                    </div>
                                                <?php
                                                endforeach;
                                            else: ?>
                                                <p>Nenhuma imagem encontrada.</p>
                                            <?php
                                            endif; ?>
                                        </div>
                                    </form>

                                    <!-- <form method="POST">
                                    <div class="controles">
                                        <label><input type="checkbox" onclick="toggleTodos(this)"> Selecionar Todos</label>
                                        <button type="submit" name="excluir_selecionados" class="btn-excluir" onclick="return confirm('Excluir selecionados?')">Excluir</button>
                                    </div>

                                    <div class="galeria">
                                        <?php if ($imagem_carro):
                                            foreach ($imagem_carro as $foto):
                                                $nome = basename($foto->name); ?>
                                                <div class="card">
                                                    <input type="checkbox" name="fotos_para_excluir[]" value="<?php echo $foto->id; ?>" class="foto-check checkbox-container">
                                                    <img src="<?php echo $foto->dirImage; ?>" alt="Foto" onclick="abrirLightbox('<?php echo $foto->dirImage; ?>')">
                                                    <input id="<?php echo $foto->id; ?>" class="span12" type="hidden" name="<?php echo $foto->id; ?>" value="<?php echo $foto->id; ?>" />
                                                    <div class="card-body">
                                                        <p class="card-text"><?php echo $nome; ?></p>
                                                    </div>
                                                </div>
                                            <?php
                                            endforeach;
                                        else: ?>
                                            <p>Nenhuma imagem encontrada.</p>
                                        <?php
                                        endif; ?>
                                    </div>
                                </form> -->

                                    <p style="text-align:center;"><a href="<?php echo base_url('uploadPictury'); ?>">Fazer novo Upload</a></p>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Lightbox - movido para fora da estrutura principal para funcionar corretamente -->
<div id="lightbox" onclick="fecharLightbox()">
    <span class="fechar-lightbox">&times;</span>
    <img id="img-lightbox" src="" alt="Ampliada">
</div>
<script>
    function toggleTodos(source) {
        const checkboxes = document.querySelectorAll('.foto-check');
        checkboxes.forEach(cb => cb.checked = source.checked);
    }
</script>