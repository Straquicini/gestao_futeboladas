<?php
include '../inc/config.php';
include '../inc/functions.php';
$pdo = pdo_connect_mysql();
$msg = '';

if (isset($_GET['id'])) {

    if (isset($_GET['status'])){
        if ($_GET['status'] == 'ok'){
            $msg = 'Registro atualizado com sucesso.';
        }
    }


    if (!empty($_POST)) {
        $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
        $cor = isset($_POST['cor']) ? $_POST['cor'] : '';
        $hino = isset($_POST['hino']) ? $_POST['hino'] : '';
        $idclube = $_GET['id'];

        if ($nome != '' && $cor != '' && $hino != ''){
            // Update the record
            $stmt = $pdo->prepare('UPDATE clube SET nome = ?, cor = ?, hino = ? WHERE idclube= ?');
            $stmt->execute([$nome, $cor, $hino,$idclube]);
            $msg = 'Registro atualizado com sucesso.';

            // guardar os dados de classificados_em
            $idtabela = isset($_POST['idtabela']) ? intval($_POST['idtabela']) : 0;
            if ($idtabela > 0){
                // inserir ou atualizar relação em 'classificado_em'
            } else {
                // eliminar/retirar relação em 'classificado_em'
                $stmt = $pdo->prepare('DELETE FROM classificado_em WHERE idclube = ?');
                $stmt->execute([$idclube]);
            }

            //redirect para quer nao haja 'reenvio' de atualizacao dos dados
            // submetidos pelo formulario
            header("Location: clube_update.php?id=" . $_GET['id'] . "&status=ok");
            exit;
        }
    }
    // Get the contact from the clube table
    $stmt = $pdo->prepare('SELECT * FROM clube WHERE idclube = ?');
    $stmt->execute([$_GET['id']]);
    $item = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$item) {
        exit('Não encontro nenhum registro com esse ID!');
    }
} else {
    exit('No ID specified!');
}
?>



<?=template_header('Clubes :: Editar/Ver', $project_path)?>

<div class="content update">
	<h2>Atualizar Clube #<?=$item['idclube']?></h2>
    <form action="clube_update.php?id=<?=$item['idclube']?>" method="post">

        <label for="nome">Nome do Clube</label>
        <label for="created">Cor</label>
        <input value="<?=$item['nome']?>" maxlength=100 type="text" required name="nome" placeholder="Escreva o nome do clube" id="nome">
        <input value="<?=$item['cor']?>" maxlength=50 type="color" required name="cor" placeholder="Escreva a cor do clube" id="cor">

        <label for="hino">Hino</label>
        <textarea style="width:100%;" rows=10 required name="hino" placeholder="Escreva o hino do clube" id="hino"><?=$item['hino']?></textarea>

        <div style="width:100%">
            <label for="idclube">Pertence à Tabela: </label>
            <br>
            <select name="idclube" id="idclube">
                <option value="0">- sem tabela associada -</option>
                <?php
                    $staux = $pdo->prepare('SELECT * FROM tabela ORDER BY idtabela');
                    $staux->execute();
                    $lista_tabelas = $staux->fetchAll(PDO::FETCH_ASSOC);
                    foreach ($lista_tabelas as $item):
                        $chk = "";
                        if($item['idtabela'] == $0){

                        }
                        echo '<option ' . $chk . ' value="' . $item['idtabela'] . '">' . $item['nome'] . '</option>';
                    endforeach;
                ?>
            </select>
        </div>
       
        <input type="submit" value="atualizar">
        <button type="button" class="danger" onclick="javascript:location.href='clube_read.php'">Cancelar</button>
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>