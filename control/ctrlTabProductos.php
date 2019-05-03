<?php
	include_once("../modelo/producto.php");
	include_once("../modelo/ErroresAplic.php");
	$arrProd=null;
	$oProd= new producto();
	$nErr=-1;
	$sCadJson="";
	try{
		$arrProd=$oProd->buscar("SELECT * FROM Productos");
	}catch(Exception$e){
		$nErr=ErroresAplic::ERROR_EN_BD;
	}

	if($nErr==-1){

		$sCadJson=
			'{	"success":true,
				"sSit":"ok",
				"arrProductos":[';
			foreach($arrProd as $oProd){
				$sCadJson=$sCadJson.'{
					"nCveProd":'.$oProd->getClave().',
					"sNomProducto":"'.$oProd->getNombre().'",
					"nPrecio":'.$oProd->getPrecio().',
					"sTallas":"'.$oProd->getTalla().'",
					"sTamanos":"'.$oProd->getSize().'",
					"sColores":"'.$oProd->getColor().'",
					"sTipo":"'.$oProd->getTipo().'",
					"sEquipo":"'.$oProd->getEquipo().'",
					"sDisciplina":"'.$oProd->getDisciplina().'",
					"nCantidad":'.$oProd->getCantidad().',
					"sGenero":"'.$oProd->getGenero().'",
					"sImg":"'.$oProd->getImagen().'"},';
				}
			$sCadJson=substr($sCadJson,0,strlen($sCadJson)-1);
			$sCadJson=$sCadJson.']
			}';
	}else{
		$oErr->setError($nErr);
		$sCadJson=
		'{
			"success":false,
			"sSit":"'.$oErr->getTextoError().'",
			"arrProductos":[]
		}';
	}
	header('Content-type:application/json');
	echo $sCadJson;
?>
