<nav>
<?php
  if(isset($_SESSION["usuario"])){
    $oUsu = $_SESSION["usuario"];
    $sTipo = $oUsu->getTipo();
    if($sTipo=="Administrador"){  
?>
      <ul>    
        <li><a href="altas.php">ALTAS</a></li>
        <li><a href="mostrar.php">BAJAS</a></li>
        <li><a href="mostrar.php">C&Aacute;MBIOS</a></li>
        <li><a href="mostrar.php">CONSULTAS</a></li>
      </ul>
<?php 
    } else {
?>
      <ul>
        <li><a href="tabProducto.php">CAT&Aacute;LOGO COMPLETO</a></li>   
        <li><a href="productosTipo.php?mtipo=Balon">BALONES</a></li>
        <li><a href="productosTipo.php?mtipo=Souvenir">SOUVENIRS</a></li>
      </ul>
<?php      
    }
  } else {  
?>
  <ul>
  <li><a href="tabProducto.php">CAT&Aacute;LOGO COMPLETO</a></li>    
    <li><a href="productosTipo.php?mtipo=Balon">BALONES</a></li>
    <li><a href="productosTipo.php?mtipo=Souvenir">SOUVENIRS</a></li>
  </ul>
<?php 
  } 
?>
</nav>