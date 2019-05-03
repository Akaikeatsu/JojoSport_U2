<?php 
include_once("../modelo/usuario.php");
include_once("../modelo/producto.php");
session_start();
$oProducto = new producto();
$oUsu = new usuario();
$nErr = -1;
$sErr = "no hubo ningun error";

if (isset($_SESSION["usuario"]) && !empty($_SESSION["usuario"])) {
	$oUsu=$_SESSION["usuario"];
	if ($oUsu->getTipo() == "Administrador") {
		if (isset($_POST["sNomProducto"]) && !empty($_POST["sNomProducto"]) && 
			isset($_POST["nPrecio"]) && !empty($_POST["nPrecio"]) && 
			isset($_POST["sTallas"]) && !empty($_POST["sTallas"]) && 
			isset($_POST["sTamanos"]) && !empty($_POST["sTamanos"]) && 
			isset($_POST["sColores"]) && !empty($_POST["sColores"]) && 
			isset($_POST["sTipo"]) && !empty($_POST["sTipo"]) && 
			isset($_POST["sEquipo"]) && !empty($_POST["sEquipo"]) && 
			isset($_POST["sDisciplina"]) && !empty($_POST["sDisciplina"]) && 
			isset($_POST["nCantidad"]) && !empty($_POST["nCantidad"]) && 
			isset($_POST["sTamanos"]) && !empty($_POST["sTamanos"]) && 
			isset($_POST["sImg"]) && !empty($_POST["sImg"])) {

			$oProducto->setNombre($_POST["sNomProducto"]);
			$oProducto->setPrecio($_POST["nPrecio"]);
			$oProducto->setTalla($_POST["sTallas"]);
			$oProducto->setSize($_POST["sTamanos"]);
			$oProducto->setColor($_POST["sColores"]);
			$oProducto->setTipo($_POST["sTipo"]);
			$oProducto->setEquipo($_POST["sEquipo"]);
			$oProducto->setDisciplina($_POST["sDisciplina"]);
			$oProducto->setCantidad($_POST["nCantidad"]);
			$oProducto->setGenero($_POST["sTamanos"]);
			$oProducto->setImagen($_POST["sImg"]);
			$oProducto->setCveAdmin($oUsu->getClave());

			if ($oProducto->agregarProdcuto() == -1) {
				$nErr = 1;
				$sErr = "Error al agregar el prducto a la base de datos";
			}
		}else{
			$nErr = 1;
			$sErr = "No se ha enviado ningún dato";
		}
	}else{
		$nErr = 1;
		$sErr = "Esta cuenta no esta autorizada para dar de alta Productos";
	}
}else{
	$nErr = 1;
	$sErr="No se ha inicado una Sesión";
}

if ($nErr==-1) {
   	echo "Insertado con éxito";
} else {
   	echo $sErr;
}

 ?>