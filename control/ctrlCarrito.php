<?php 
include_once("../modelo/compra.php");
include_once("../modelo/usuario.php");
session_start();
$nError = -1;
$sError="";
$nCveUsu;
$oCompra;
$sCadJSON = "";
	if (isset($_SESSION["usuario"]) && !empty($_SESSION["usuario"])) {
		$nCveUsu = $_SESSION["usuario"]->getClave();
		if(isset($_POST["id_prod"]) && !empty($_POST["id_prod"])) {
			$oCompra = new compra();
			$oCompra->setCveProd($_POST["id_prod"]);
			$oCompra->setCveUsu($nCveUsu);
			$oCompra->setCantidad($_POST["prod_qty"]);
			$nError = $oCompra->guardarCompra();
		}else{
			$sError="Error en la BD";
		}
	}else{
		$sError="No ha iniciado sesion";
	}

	if($nError==-1){
		$sCadJSON='{
			"Success":false,
			"Description":"Error al A&ntilde;adir el Producto: '.$sError.'"
	  	}';
	}else{
		$sCadJSON='{
			"Success":true,
			"Description":"Producto A&ntilde;adido al carrito" 
	    }';
	}

	header('Content-type:application/json');
	echo $sCadJSON;

 ?>