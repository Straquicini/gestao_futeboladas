<?php
include '../inc/config.php';
include '../inc/functions.php';
$pdo = pdo_connect_mysql();
$msg = '';
// Check if the contact id exists, for example update.php?id=1 will get the contact with the id of 1
if (isset($_GET['id'])) {

    if (!empty($_POST)) {
    $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
    $cor = isset($_POST['cor']) ? $_POST['cor'] : '';
    $hino = isset($_POST['hino']) ? $_POST['hino'] : '';

        if ($nome != '' && $cor != '' && $hino != ''){
            // Update record 
            $stmt = $pdo->prepare('UPDATE clube SET nome=?, cor=?, hino=? WHERE idclube = ?');
            $stmt->execute([$nome, $cor, $hino, $_GET['id']]);

            //redirect para quer nao haja 'reenvio' de atualizacao dos dados
            // submetidos pelo formulario
            header("Location: clube_update.php?id=" . $_GET['id'] . "&status=ok");
            exit;
        }
    }

    // Get the contact from the clube table
    $stmt = $pdo->prepare('SELECT * FROM clube WHERE idclube = ?');
    $stmt->execute([$_GET['id']]);
    $item_clube = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$item_titem_clube) {
        exit('Não encontro nenhum registro com esse ID!');
    }
} else {
    exit('No ID specified!');
}
?>



<?=template_header('Clubes :: Editar/Ver', $project_path)?>

<div class="content update">
	<h2>Atualizar Clube #<?=$item_clube['idclube']?></h2>
    <form action="clube_update.php?id=<?=$item_clube['idclube']?>" method="post">
        <label for="id">ID</label>
        <label for="nome">Nome do Clube</label>
        <input type="text" name="id" placeholder="1" value="<?=$item_clube['idclube']?>" id="id">
        <input type="text" name="nome" placeholder="Nome do Clube" value="<?=$item_clube['nome']?>" id="nome">
       
        <input type="submit" value="Update">
        <button type="button" class="danger" onclick="javascript:location.href='clube_read.php'">Cancelar</button>
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>