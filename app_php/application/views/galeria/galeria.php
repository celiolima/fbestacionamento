<?php
$diretorio = 'public/uploads/';
$mensagem = "";

// Lógica de Exclusão Múltipla
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['excluir_selecionados'])) {
    if (!empty($_POST['fotos_para_excluir'])) {
        $contagem = 0;
        $diretorioReal = realpath($diretorio);
        foreach ($_POST['fotos_para_excluir'] as $nomeFoto) {
            $caminhoCompleto = realpath($diretorio . basename($nomeFoto));
            if ($caminhoCompleto && strpos($caminhoCompleto, $diretorioReal) === 0 && file_exists($caminhoCompleto)) {
                unlink($caminhoCompleto);
                $contagem++;
            }
        }
        $mensagem = "Sucesso: $contagem foto(s) excluída(s).";
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

        <div class="row clearfix">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="container">
                                <h2>📸 Minha Galeria</h2>
                                <?php if ($mensagem) echo "<p><strong>$mensagem</strong></p>"; ?>

                                <form method="POST">
                                    <div class="controles">
                                        <label><input type="checkbox" onclick="toggleTodos(this)"> Selecionar Todos</label>
                                        <button type="submit" name="excluir_selecionados" class="btn-excluir" onclick="return confirm('Excluir selecionados?')">Excluir</button>
                                    </div>

                                    <div class="galeria">
                                        <?php if ($arquivos):
                                            foreach ($arquivos as $foto):
                                                $nome = basename($foto); ?>
                                                <div class="card">
                                                    <input type="checkbox" name="fotos_para_excluir[]" value="<?php echo $nome; ?>" class="foto-check checkbox-container">
                                                    <img src="<?php echo $foto; ?>" alt="Foto" onclick="abrirLightbox('<?php echo $foto; ?>')">
                                                </div>
                                            <?php
                                            endforeach;
                                        else: ?>
                                            <p>Nenhuma imagem encontrada.</p>
                                        <?php
                                        endif; ?>
                                    </div>
                                </form>

                                <p style="text-align:center;"><a href="<?php echo base_url('uploadPictury'); ?>">Fazer novo Upload</a></p>
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