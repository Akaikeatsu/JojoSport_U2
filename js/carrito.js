$(document).ready(function() {
	//$(".btnList").button();
});

function removList(){
	//event.preventDefault();
	var cve = $("#txtClav").val();
	//alert("Funcionó");
	var llamada = $.post(
		"control/ctrlABCCompra.php",
		{
			nCve:cve
		},
		function(oDatos){
        	//alert(oDatos.sSit);
        	repintarTabComp(oDatos);
		}
	);
	llamada.fail(function(objRequest, status){
		alert("Error al invocar al servidor, intente posteriormente");
		console.log(status);
	});
}

function repintarTabComp(oDatos){
	if (oDatos.success==true){
		alert("Compra Eliminada correctamente");
		$(".oCompra").remove();
		pintaTabCompras();
		$("#txtClavs").val("");
	}else{
		alert("Error: "+oDatos.sSit);
	}
}

function pintaTabCompras(){
	var sURL = 'control/ctrlTabCompras.php';
	var llamada = $.get(
		sURL, {}, function(oDatos){
			var tbl_body = $("#tbl_compras_bdy");
			var line = $("<tr/>");
			var cld_Prod = $("<td/>");
			var cld_Prec = $("<td/>");
			var cld_Cant = $("<td/>");
			var cld_SubT = $("<td/>");
			var cld_Act = $("<td/>");
			var btn_Del = $("<input/>");
			var nSubT;
			var nTotal=0;
			if (oDatos!=null) {
				if (tbl_body!=null) {
					if (oDatos.success) {
						for (i=0; i< oDatos.arrCompras.length; i++){
							cld_Prod.html(oDatos.arrCompras[i].sPord);
							//cld_Prod.attr({class: "td_lista"});
							cld_Prec.html(oDatos.arrCompras[i].nPrec);
							cld_Prec.attr({class: "td_lista"});
							cld_Cant.html(oDatos.arrCompras[i].nCant);
							cld_Cant.attr({class: "td_lista"});
							nSubT = oDatos.arrCompras[i].nPrec*oDatos.arrCompras[i].nCant;
							cld_SubT.html(nSubT);
							cld_SubT.attr({class: "td_lista"});
							btn_Del.attr({
								type : "submit",
								onclick: "txtClav.value='"+oDatos.arrCompras[i].nCve+"'; removList();",
								class: "ui-button ui-corner-all",
								value: "Quitar de la Lista"
							});
							cld_Act.append(btn_Del);
							cld_Act.attr({class: "td_lista"});
							line.attr({class:"oCompra"});
							line.append(cld_Prod,cld_Prec,cld_Cant,cld_SubT,cld_Act);
							tbl_body.append(line);
							nTotal+=nSubT;
							line = $("<tr/>");
							cld_Prod = $("<td/>");
							cld_Prec = $("<td/>");
							cld_Cant = $("<td/>");
							cld_SubT = $("<td/>");
							cld_Act = $("<td/>");
							btn_Del = $("<input/>");
						}
					}else{
						alert(oDatos.sSit)
					}
				}else{
					alert("Error HTML");
				}
			}else{
				alert("no hay oDatos");
			}
		}
	);
	llamada.fail(function(objRequest, status){
		alert("Error al invocar al servidor, intente posteriormente");
		console.log(status);
	});
}