<?php 
include_once("conectar.php");
/**
 * 
 */
class compra {
	
	private $nCveCompra;
	private $nCveProd;
	private $nCveUsu;	
	private $dFecha;
	private $nCantidad;
	private $sEstado;

	private $sNomProd;
	private $nPrecio;

	function setCveCompra($value){
		$this->nCveCompra = $value;
	}
	function setCveProd($value){
		$this->nCveProd = $value;
	}
	function setCveUsu($value){
		$this->nCveUsu = $value;
	}
	function setFecha($value){
		$this->dFecha = $value;
	}
	function setCantidad($value){
		$this->nCantidad = $value;
	}
	function setEstado($value){
		$this->sEstado = $value;
	}

	function setNomProd($value){
		$this->sNomProd = $value;
	}
	function setPrecio($value){
		$this->nPrecio = $value;
	}

	function getCveCompra(){
		return $this->nCveCompra;
	}
	function getCveProd(){
		return $this->nCveProd;
	}
	function getCveUsu(){
		return $this->nCveUsu;
	}
	function getFecha(){
		return $this->dFecha;
	}
	function getCantidad(){
		return $this->nCantidad;
	}
	function getEstado(){
		return $this->sEstado;
	}

	function getNomProd(){
		return $this->sNomProd;
	}
	function getPrecio(){
		return $this->nPrecio;
	}

	function guardarCompra(){
		$oConexion = new conexion();
		$nAfectados = -1;
		$sQuery="";
		if ($oConexion->conecta()) {
			//INSERT INTO `compras`(`nCveCompra`, `nCveProd`, `nCveUsu`, `dFecha`, `nCantidad`, `sEstado`) VALUES (1,1,1,CURDATE(),1,'Pendiente')
			$sQuery="INSERT INTO compras (nCveProd, nCveUsu, dFecha, nCantidad, sEstado)
			VALUES (".$this->getCveProd().", ".$this->getCveUsu().", CURDATE(), ".$this->getCantidad().", 'Pendiente')";
			$nAfectados=$oConexion->ejecutarComando($sQuery);
			$oConexion->desconecta();
		}
		return $nAfectados;
	}

	function eliminaCompra(){
		$oConexion = new conexion();
		$nAfectados = -1;
		$sQuery="";
		if ($oConexion->conecta()) {
			$sQuery="DELETE FROM compras WHERE nCveCompra = ".$this->getCveCompra().";";
			$nAfectados=$oConexion->ejecutarComando($sQuery);
			$oConexion->desconecta();
		}
		return $nAfectados;
	}

	function buscaCompras($CveUsu){
		$oConexion = new conexion();
        $arrayCompras = null;
        $oAdd;
        $sQuery = "SELECT * FROM compras WHERE nCveUsu=".$CveUsu;
        if ($oConexion->conecta()) {
            $Obtenido = $oConexion->ejecutaConsulta($sQuery);
            for($i = 0; $i <count($Obtenido); $i++){
               $oAdd = $oConexion->ejecutaConsulta("SELECT sNomProducto, nPrecio FROM productos WHERE nCveProd=".$Obtenido[$i][1]);
                $datos = new compra();
                $datos->setCveCompra($Obtenido[$i][0]);
                $datos->setCveProd($Obtenido[$i][1]);
                $datos->setCveUsu($Obtenido[$i][2]);
                $datos->setFecha($Obtenido[$i][3]);
                $datos->setCantidad($Obtenido[$i][4]);
                $datos->setEstado($Obtenido[$i][5]);
                $datos->setNomProd($oAdd[0][0]);
                $datos->setPrecio($oAdd[0][1]);
                $arrayCompras[$i] = $datos;
            }
        }
        $oConexion->desconecta();
        return $arrayCompras;
	}

}
 ?>