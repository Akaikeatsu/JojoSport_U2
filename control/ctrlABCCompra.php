<?php 
//include_once("../modelo/usuario.php");
include_once("../modelo/compra.php");
//session_start();
$nCve;
$oCompra = new compra();
$nErr=-1;
$sErr="";
$sCadJson ="";

	if (isset($_POST["nCve"]) && !empty($_POST["nCve"])){
		$nCve=$_POST["nCve"];
		$oCompra->setCveCompra($nCve);
		try{
			$oCompra->eliminaCompra();
		}catch(Exception $e){
			error_log($e->getFile()." ".$e->getLine()." ".$e->getMessage(),0);
			$nErr = 1;
			$sErr="No se encontro la Compra en la lista";
		}
	}else{
		$nErr=1;
		$sErr="No se ha enviado una Clave de Compra";
	}

	if($nErr == -1){
		$sCadJson = 
		'{
			"success":true,
			"sSit":"ok"
		}';
	}else{
		$sCadJson = 
		'{
			"success":false,
			"sSit": "'.$sErr.'"
		}';
	}
	header('Content-type: application/json');
	echo $sCadJson;
	exit();

 ?>