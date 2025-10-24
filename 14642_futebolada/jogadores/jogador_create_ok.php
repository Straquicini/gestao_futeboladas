<?php
include '../inc/config.php';
include '../inc/functions.php';
$pdo = pdo_connect_mysql();
$msg = 'Inserido com sucesso!';

?>


<?=template_header('Jogador : Inserir', $project_path)?>

<div class="content update">
	<h2>Jogador : Inserir</h2>

    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>

    <button type="button" class="danger" onclick="javascript:location.href='jogador_read.php'">
        Voltar à listagem 
    </button>

</div>

<?=template_footer()?>