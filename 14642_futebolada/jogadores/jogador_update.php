<?php
include '../inc/config.php';
include '../inc/functions.php';
$pdo = pdo_connect_mysql();
$msg = '';
// Check if the contact id exists, for example update.php?id=1 will get the contact with the id of 1
if (isset($_GET['id'])) {

    if (isset($_GET['status'])){
        if ($_GET['status'] == 'ok'){
            $msg = 'Registro atualizado com sucesso.';
        }
    }

    if (!empty($_POST)) {
        // This part is similar to the create.php, but instead we update a record and not insert
        $nome = isset($_POST['nome']) ? $_POST['nome'] : '';

       
        // Update the record
        $stmt = $pdo->prepare('UPDATE jogador SET nome = ? WHERE numjogador = ?');
        $stmt->execute([$nome, $_GET['id']]);
        $msg = 'Registro atualizado com sucesso.';

        //redirect para quer nao haja 'reenvio' de atualizacao dos dados
        // submetidos pelo formulario
        header("Location: jogador_update.php?id=" . $_GET['id'] . "&status=ok");
        exit;
    }
    // Get the contact from the jogador table
    $stmt = $pdo->prepare('SELECT * FROM jogador WHERE numjogador = ?');
    $stmt->execute([$_GET['id']]);
    $item_jogador = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$item_jogador) {
        exit('Não encontro nenhum registro com esse ID!');
    }
} else {
    exit('No ID specified!');
}
?>



<?=template_header('Jogadores :: Editar/Ver', $project_path)?>

<div class="content update">
	<h2>Atualizar Jogador #<?=$item_jogador['numjogador']?></h2>
    <form action="jogador_update.php?id=<?=$item_jogador['numjogador']?>" method="post">
        <label for="id">ID</label>
        <label for="nome">Nome do Jogador</label>
        <input type="text" name="id" placeholder="1" value="<?=$item_jogador['numjogador']?>" id="id">
        <input type="text" name="nome" placeholder="Nome do Jogador" value="<?=$item_jogador['nome']?>" id="nome">
       
        <input type="submit" value="Update">
        <button type="button" class="danger" onclick="javascript:location.href='jogador_read.php'">Cancelar</button>
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>