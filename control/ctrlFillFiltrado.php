<?php
	include_once("../modelo/producto.php");
	include_once("../modelo/ErroresAplic.php");
    $sCve = "";
    $nErr = -1;
    $oEquipo= new producto();
    $arrEquipo = null;
    $oDisciplina= new producto();
    $arrDisciplina = null;
    $sCadJson="";
    $oErr = new ErroresAplic();

	try{
        $arrEquipo=$oEquipo->buscar("SELECT * FROM Productos GROUP BY sEquipo");
        $arrDisciplina=$oDisciplina->buscar("SELECT * FROM Productos GROUP BY sDisciplina");
	}catch(Exception $e){
		$nErr=ErroresAplic::ERROR_EN_BD;
	}

	if($nErr==-1){
        $sCadJson=
        '{
            "success":true,
            "sSit":"ok",
            "arrEquipo":[';
			
			foreach($arrEquipo as $oEquipo){
				$sCadJson=$sCadJson.'{"sEquipo":"'.$oEquipo->getEquipo().'"},';
				}
			$sCadJson=substr($sCadJson,0,strlen($sCadJson)-1);
            $sCadJson=$sCadJson.'],
            "arrDisciplina":[';
			
			foreach($arrDisciplina as $oDisciplina){
				$sCadJson=$sCadJson.'{"sDisciplina":"'.$oDisciplina->getDisciplina().'"},';
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
			"arrProductos":"'.$sCve.'"
		}';
	}
	header('Content-type:application/json');
	echo $sCadJson;
?>
