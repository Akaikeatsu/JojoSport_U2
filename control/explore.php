<?php
include_once('../modelo/producto.php');
include_once('../modelo/ErroresAplic.php');

$oProductos = new producto();
$nErr=-1;
$sCadJson ="";
$type = $_GET["mtipo"];

if (isset($type) && !empty($type)){ 
  if($type!="none"){
		$sQuery= "SELECT * FROM Productos WHERE sTipo='$type'";
		$producto = $oProductos->buscar($sQuery);
		if(is_null(array_reverse($producto)))
		$nErr = ErroresAplic::FALTAN_DATOS;
  }else {
	$sQuery= "SELECT * FROM Productos";
 	$producto = $oProductos->buscar($sQuery);
   }
}



if ($nErr == -1){
	$sCadJson = 
	'{
		"success":true,
		"sSit": "ok",
		"producto":[';

	foreach($producto as $oProductos){
		$sCadJson = $sCadJson.'{
			    "clave": "'.$oProductos->getClave().'", 
				"imagen": "'.$oProductos->getImagen().'", 
				"nombre":"'.$oProductos->getNombre().'",
				"equipo":"'.$oProductos->getEquipo().'",
				"disciplina":"'.$oProductos->getDisciplina().'",
				"precio":"'.$oProductos->getPrecio().'"
				},';
	}

	$sCadJson = substr($sCadJson,0, strlen($sCadJson)-1);

	$sCadJson = $sCadJson.'
		]
	}';
}
else{
	$oErr->setError($nErr);
	$sCadJson = 
	'{
		"success":false,
		"sSit": "'.$oErr->getTextoError().'",
		"producto": []
	}';
}
header('Content-type: application/json');
echo $sCadJson;
?>