<?php 
include_once("cabecera.php");
include_once("menu.php");
 ?>
<section id="section_listcompr">
    <form name="lista" id="lista_compras" onsubmit="return false;">
        <input type="hidden" name="txtClav" id="txtClav">
        <table class="tbl_lista" id="tbl_compras">
            <thead>
                <tr>
                    <th class="th_lista">Producto</th>
                    <th class="th_lista">Precio</th>
                    <th class="th_lista">Cantidad</th>
                    <th class="th_lista">Subtotal</th>
                    <th class="th_lista">Acci&oacute;n</th>
                </tr>
            </thead>
            <tbody id="tbl_compras_bdy">
            </tbody>
        </table>
    </form>
    <script src="js/carrito.js"></script>
    <script>pintaTabCompras();</script>
</section>
<?php 
include_once("pie.html");
 ?>