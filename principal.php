<?php
   session_start();//Caso o usuario copiar a url ele ira ter que voltar para a tela de login
   if(!isset($_SESSION['id_usuarios']))
   {
     header("location: index.php");
     exit;
   }
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar_produto</title>
</head>
<body>
    <form method="POST" action="principal_conexao/cadastro.php">
      <label>Numero da caixa  
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
    
      <label>    Descrição</label>
      <br>
      <input type="number" name="caixa" maxlength="3" >
      <input type="text" name="descricao" >
      <br>
      <input type="submit" value="cadastro">
    </form>
    
</body>
</html>