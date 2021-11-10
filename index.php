<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="banco_login/style.css">
    <title>Login</title>
</head>
<body>
    <div id="corpo-form">
    <h1>Logar</h1>
    <form method="POST" > 
        <label>Usuario:</label>
        <input type="text" name="nome" placeholder="Nome de Usuario">
        </br>
        </br>
        <label>Senha:</label>
        <input type="password" name="senha " placeholder="Coloque sua senha">
        </br>
        </br>
        </br>
        <input type="submit" value="Logar">
    </div>  
    </form>
<?php
   //verificar se clicou no botão
     isset($_POST['nome']);
     {
         $nome = addslashes($_POST['nome']);
         $senha = addslashes($_POST['senha']);
         //verificar se esta vazio
         if(!empty($nome) && !empty($senha)) 
         {

         }else
         {
             echo "Preencha todos os campos";
         }
     }
?>    
</body>
</html>