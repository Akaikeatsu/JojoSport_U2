<?php 
include_once("cabecera.php");
include_once("menu.php");
 ?>
<section id="section_altProd">
	<form class="form_altas" method="POST" action="control/ctrlProductos.php">
		<label>Nombre del Producto:</label>
		<input type="text" id="sNomProducto" name="sNomProducto" required><br><br>
		<label>Precio:</label>
		<input type="number" step="0.01" id="nPrecio" name="nPrecio" required><br><br>
		<label>Talla:</label>
		<select class="selectable" name="sTallas" id="sTallas" required>
		    <option value="N/A">N/A</option>
		    <option value="Chico">Chico</option>
		    <option value="Mediano">Mediano</option>
		    <option value="Grande">Grande</option>
		 </select><br><br>
		<label>Tama&ntilde;o:</label>
		<select class="selectable" name="sTamanos" id="sTamanos" required>
		    <option value="N/A">N/A</option>
		    <option value="Chico">Chico</option>
		    <option value="Mediano">Mediano</option>
		    <option value="Grande">Grande</option>
		</select><br><br>
		<label>Colores:</label>
		<input type="text" id="sColores" name="sColores" required><br><br>
		<label>Tipo:</label>
		<select class="selectable" name="sTipo" id="sTipo" required>
			<option value="Balón">Bal&oacute;n</option>
			<option value="Playera">Playera</option>
		    <option value="Ropa">Ropa</option>
		    <option value="Short">Short</option>
		    <option value="Souvenir">Souvenir</option>
		    <option value="Tenis">Tenis</option>
		</select><br><br>
		<label>Equipo:</label>
		<input type="text" id="sEquipo" name="sEquipo" required><br><br>
		<label>Disciplina:</label>
		<input type="text" id="sDisciplina" name="sDisciplina" required><br><br>
		<label>Cantidad:</label>
		<input type="number" id="nCantidad" name="nCantidad" required><br><br>
		<label>G&eacute;nero:</label>
		<select class="selectable" name="sTamanos" id="sTamanos" required>
		    <option value="N/A">N/A</option>
		    <option value="Masculino">Masculino</option>
		    <option value="Femenino">Femenino</option>
		</select><br><br>
		<label>Imagen:</label>
		<input type="file" id="sImg" name="sImg" accept="image/jpeg" required><br><br>
		<input id="btn_alta" type="submit" value="Agregar">
<!--nCveProd
nCveAdmin-->
	</form>
	<script src="js/controls.js"></script>
</section>
<?php 
include_once("pie.html");
 ?>