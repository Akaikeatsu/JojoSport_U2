<?php
$tipo = $_GET["mtipo"];
include_once("cabecera.php");
include_once("menu.php");
?>

<?php
$precioMostrar=false;
  if(isset($_SESSION["usuario"]) && !empty($_SESSION["usuario"])){
      $precioMostrar=true;
  }
?>

<section id="catalogo">
<h1>Recomendaciones destacadas</h1>
<script src="js/gestionProductos.js"></script>
	<script>
       var precioMostrar = "<?php echo $precioMostrar;?>";
        var tipo = "<?php echo $tipo;?>";
		pintaBalonesSouvenir(precioMostrar,tipo);
	</script>
</section>

<?php
include_once("pie.html");
?>