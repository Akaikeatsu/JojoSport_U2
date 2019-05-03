<?php 
include_once("../modelo/usuario.php");
include_once("../modelo/compra.php");
session_start();
$arrCompras=null;
$oCompra = new compra();
$nCveUs;
$nErr=-1;
$sError="";
$sCadJson ="";

	if (isset($_SESSION["usuario"]) && !empty($_SESSION["usuario"])) {
		$nCveUsu = $_SESSION["usuario"]->getClave();
		try{
			$arrCompras = $oCompra->buscaCompras($nCveUsu);
		}catch(Exception $e){
			error_log($e->getFile()." ".$e->getLine()." ".$e->getMessage(),0);
			$nErr=1;
			$sError="Error al ejecutar la consulta";
		}
	}else{
		$nErr=1;
		$sError="No se ha iniciado una sesion";
	}

	if ($nErr == -1){
		$sCadJson = 
		'{
			"success":true,
			"sSit": "ok",
			"arrCompras":[';
			foreach($arrCompras as $oCompra){
				$sCadJson = $sCadJson.'{
					"nCve": '.$oCompra->getCveCompra().', 
					"sPord": "'.$oCompra->getNomProd().'",
					"nPrec": '.$oCompra->getPrecio().',
					"nCant": '.$oCompra->getCantidad().'
				},';
			}
			$sCadJson = substr($sCadJson,0, strlen($sCadJson)-1);
			$sCadJson = $sCadJson.'
			]
		}';
	}else{
		$sCadJson = 
		'{
			"success":false,
			"sSit": "'.$sError.'",
			"arrCompras": []
		}';
	}
	header('Content-type: application/json');
	echo $sCadJson;
 ?>