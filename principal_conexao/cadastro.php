<?php
include_once("conexaocad.php");

$caixa = filter_input(INPUT_POST, 'caixa', FILTER_SANITIZE_STRING);
$descricao = filter_input(INPUT_POST, 'descricao', FILTER_SANITIZE_STRING);

$result_produto = "INSERT INTO produto(caixa, descricao) VALUES ('$caixa', '$descricao')";
$resultado_produto = mysqli_query($conn, $result_produto);

if(mysqli_insert_id($conn)){
    header("location: ../principal.php");
}else{
    header("location: ../banco_login/erro.php");
}      
?>