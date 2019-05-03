<?php
include_once("cabecera.php");
include_once("menu.php");
?>
<section id="section-portada" class="slider">
	<ul>
    <li><img id="portada" src="media/portada1.jpg" alt=""></li>
    <li><img id="portada" src="media/portada2.jpg" alt=""></li>
    <li><img id="portada" src="media/portada3.png" alt=""></li>
    <li><img id="portada" src="media/portada4.jpg" alt=""></li>
	</ul>
</section>

<?php
$tipo = "none";
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
				pintaRecomendados(precioMostrar,tipo);
			</script>
</section>

<?php
include_once("pie.html");
?>