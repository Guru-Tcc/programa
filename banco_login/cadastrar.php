<?php
Class Usuario
{
    private $pdo;
    public $msgERRO ="";    

    public function conectar($nome, $host, $usuario, $senha) 
    {
         global $pdo;
         global $msgERRO;

         try
         {
            $pdo = new PDO("mysql:dbname=".$nome.",host=".$host,$usuario,$senha);
        }catch(PDOException $e){
           $msgERRO = $e ->getMessage();
        }
    }
         
        public function logar($nome, $senha)
    {
         global $pdo;
         //verificar se o usuario e senha estao cadastrados,se sim
         $sql =$pdo ->prepare("SELECT id FROM usuarios WHERE nome = :n AND senha =:s");
         $sql -> bindValue(":n",$nome);
         $sql -> bindValue(":s",$senha);
         $sql-> execute();

               //consulta ao BD
         if($sql->rowCount() > 0)
         {
              //entrar no sistema (sessao)
              $dado =$sql->fetch();
              session_start();
              $_SESSION['id'] =$dado['id'];
              return true ; //logado com sucesso
         }else{
              return false;//não foi possivel logar
              header("location;../index.php");
         }
         
    }
   
}