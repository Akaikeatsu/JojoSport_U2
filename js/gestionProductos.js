//Funciones para pintar Recomendados
function pintaRecomendados(precioMostrar,sTipo){
    var sURL = 'control/explore.php?mtipo='+sTipo;
        var llamada=$.post(
            sURL,
            { 
            }, 
            function(oDatos) {
                procesoPintarRecomendados(oDatos,precioMostrar);
            }
        ); 
        llamada.fail(function(objRequest, status){
            alert("Error al invocar al servidor, intente posteriormente");
            console.log(status);
        });
}

function procesoPintarRecomendados(oDatos,precioMostrar){
    var oBodySection = $('#catalogo');
    var div; 
    var img;
    var label;
    var p1, p2,p3;
    var i = 0;
    var a;
	if (oDatos.success==true){
		for (i=0; i < 9 ; i++){
            div = $('<div/>').attr("id","productoMuestra");
            img = $('<img/>').attr("src",oDatos.arrProductos[i].sImg);
            label = $('<label/>').attr("id","nombre");
            label = label.text(oDatos.arrProductos[i].sNomProducto);
            p1 = $('<p/>').text("Equipo: "+oDatos.arrProductos[i].sEquipo);
            p2 =  $('<p/>').text("Disciplina: "+oDatos.arrProductos[i].sDisciplina);
            if(precioMostrar==true){
            p3 =  $('<p/>').text("$"+oDatos.arrProductos[i].precio);
            }else{
            p3 =  $('<p/>').text("");
            }
            p3.append("<br><br>");
            a = $('<a/>').attr("href","detalleProducto.php?clv="+oDatos.arrProductos[i].nCveProd);
            a.html("Detalles");
            a.css({
               color:"#464444",
               'font-size': 16,
               'text-decoration': "none"
            });
            div.append(img,label,p1,p2,p3,a);
            oBodySection.append(div);
		}; 
	}else{
		sError = oDatos.sSit;
		alert(sError);
	}
}

//Funciones para pintar balones o souvenirs
function pintaBalonesSouvenir(precioMostrar,sTipo){
    var sURL = 'control/explore.php?mtipo='+sTipo;
        var llamada=$.post(
            sURL,
            { 
            }, 
            function(oDatos) {
                procesoPintaBalonesSouvenir(oDatos,precioMostrar);
            }
        ); 
        llamada.fail(function(objRequest, status){
            alert("Error al invocar al servidor, intente posteriormente");
            console.log(status);
        });
}

function procesoPintaBalonesSouvenir(oDatos,precioMostrar){
    var oBodySection = $('#catalogo');
    var div; 
    var img;
    var label;
    var p1, p2,p3;
    var a;
    var i = 0;
	if (oDatos.success==true){
		for (i=0; i < oDatos.arrProductos.length ; i++){
            div = $('<div/>').attr("id","productoMuestra");
            img = $('<img/>').attr("src",oDatos.arrProductos[i].sImg);
            label = $('<label/>').attr("id","nombre");
            label = label.text(oDatos.arrProductos[i].sNomProducto);
            p1 = $('<p/>').text("Equipo: "+oDatos.arrProductos[i].sEquipo);
            p2 =  $('<p/>').text("Disciplina: "+oDatos.arrProductos[i].sDisciplina);
            if(precioMostrar==true){
            p3 =  $('<p/>').text("$"+oDatos.arrProductos[i].precio);
            }else{
            p3 =  $('<p/>').text("");
            }
            p3.append("<br><br>");
            a = $('<a/>').attr("href","detalleProducto.php?clv="+oDatos.arrProductos[i].nCveProd);
            a.html("Detalles");
            a.css({
               color:"#464444",
               'font-size': 16,
               'text-decoration': "none"
            });
            div.append(img,label,p1,p2,p3,a);
            oBodySection.append(div);
		}; 
	}else{
		sError = oDatos.sSit;
		alert(sError);
	}
}

//Funciones para pintar Catalogo Completo
//hey Palafox aqui va tu parteeeeeeeeeeeeeeeeeeeeeee v: atte. Ana  
function pintaTablaProductos(){
    var sURL = 'control/ctrlTabProductos.php';
        var llamada=$.post(
            sURL,
            { 
            }, 
            function(oDatos) {
                ProsPinTabProd(oDatos);
            }
        ); 
        llamada.fail(function(objRequest, status){
            alert("Error al invocar al servidor, intente posteriormente");
            console.log(status);
        });
}

function ProsPinTabProd(oDatos){    
    var oBodySection = $('#catalogo');
    var div,div2; 
    var img;
    var label;
    var p1, p2,p3;
    var a;
    var f;
    var i = 0;
	if (oDatos.success==true){
        oBodySection.empty();
        pintaSelector();        
        div2 = $('<div/>').attr("id","container");
		for (i=0; i < oDatos.arrProductos.length ; i++){
            div = $('<div/>').attr("id","productoMuestra");
            img = $('<img/>').attr("src",oDatos.arrProductos[i].sImg);
            label = $('<label/>').attr("id","nombre");
            label = label.text(oDatos.arrProductos[i].sNomProducto);
            p1 = $('<p/>').text("Equipo: "+oDatos.arrProductos[i].sEquipo);
            p2 =  $('<p/>').text("Disciplina: "+oDatos.arrProductos[i].sDisciplina);
            p3 =  $('<p/>').text("");
            p3.append("<br><br>");
            f = $('<form/>').attr({
                id:'productoMuestraForm',
                onsubmit :"pintaDetalles("+oDatos.arrProductos[i].nCveProd+"); return false;",
            });
            a = $('<input/>').attr({
                id:'productoMuestrasubmit',
                type:'submit'

            });                
            a.text('Detalles');
            f.append(a);
            div.append(img,label,p1,p2,p3,f);
            div2.append(div);
            oBodySection.append(div2);           
        }    
            
	}else{
		sError = oDatos.sSit;
		alert(sError);
	}

}

function pintaFiltrado(){
    var sURL = 'control/ctrlFilProducto.php';
    var T1 = document.getElementById("filter1").value;		
    var T2 = document.getElementById("filter2").value;
    var llamada=$.post(
        sURL,
        {
            txtcontrol:T1,
            txtbuscado:T2
        }, 
        function(oDatos) {
            ProsPinTabProd(oDatos);
        }
    ); 
    llamada.fail(function(objRequest, status){
        alert("Error al invocar al servidor, intente posteriormente");
        console.log(status);
    });
}

function pintaSelector(){
    var sURL = 'control/ctrlFillFiltrado.php';
    var llamada=$.post(
        sURL,
        { 
        }, 
        function(oDatos) {
            ProsPinSelector(oDatos);
        }
    ); 
    llamada.fail(function(objRequest, status){
        alert("Error al invocar al servidor, intente posteriormente");
        console.log(status);
    });
}

    function ProsPinSelector(textoRespuestaFill){
        var oNodoFill = $('#catalogo');
        var sError = "";
        var form;
        var form;
        var oFilter,oOption;
                    if (oNodoFill != null){
                        if (textoRespuestaFill.success){							
                            /* FILTRADO*/
                            form = $('<form/>').attr({
                                class:"MenuFill",
                                onsubmit:"pintaFiltrado(); return false;"
                                });
                            form.insertBefore($('#container'));

                        oFilter = $('<select/>').attr('id','filter1');
                        oFilter.change(function(){
                            var ofill;
                            var oOption;                            
                            oFilter = $('#filter2');
                            ofill = $('<select/>').attr('id','filter2');
                            oFilter.replaceWith(ofill);
                            var selectedValue = $('#filter1 option:selected').val();	

                            if(selectedValue == "sEquipo"){
                                for(var i=0; i< textoRespuestaFill.arrEquipo.length; i++){
                                oOption = $('<option/>').attr("value",textoRespuestaFill.arrEquipo[i].sEquipo);
                                oOption = $('<option/>').text(textoRespuestaFill.arrEquipo[i].sEquipo);
                                $('#filter2').append(oOption);
                                }
                            
                            }else if(selectedValue == "sDisciplina"){
                                for(var i=0; i< textoRespuestaFill.arrDisciplina.length; i++){
                                    oOption = $('<option/>').attr("value",textoRespuestaFill.arrDisciplina[i].sDisciplina);
                                    oOption = $('<option/>').text(textoRespuestaFill.arrDisciplina[i].sDisciplina);
                                    $('#filter2').append(oOption);
                                }
                            }
                        
                        });
                        
                        form.append(oFilter);

                        oOption = $('<option/>').attr('value',"sEquipo");	
                        oOption.text('Equipo');					
                        $('#filter1').append(oOption);

                        oOption = $('<option/>').attr('value',"sDisciplina");	
                        oOption.text('Disciplina');					
                        $('#filter1').append(oOption);

                        oFilter = document.createElement("select");
                        oFilter.id="filter2";
                        form.append(oFilter);

                        for(var i=0; i< textoRespuestaFill.arrEquipo.length; i++){
                            oOption = $('<option/>').attr("value",textoRespuestaFill.arrEquipo[i].sEquipo);
                            oOption = $('<option/>').text(textoRespuestaFill.arrEquipo[i].sEquipo);
                            $('#filter2').append(oOption);
                        }                        
                        oFilter = $('<input/>').attr({
                            class:"Filtrado",
                            type:"submit"
                        });
                        form.append(oFilter);
                        }else{
                            //Error "de negocio"
                            sError = textoRespuestaFill;
                            oNodoFill.innerHTML = '<h4>'+textoRespuesta+'</h4>';
                        }
                    }else{
                        //Error "de codificación" (no encontró el nodo)
                        sError = "Problemas en HTML";
                    }
            if (sError != "")
                alert(sError);
        }

        function pintaDetalles(sCve){
            var sURL = 'control/ctrlDetProductos.php';
            var llamada=$.post(
                sURL,
                {
                    sCve:sCve
                }, 
                function(oDatos) {
                    procpintdetprod(oDatos);
                }
            ); 
            llamada.fail(function(objRequest, status){
                alert("Error al invocar al servidor, intente posteriormente");
                console.log(status);
            });
        }

        function procpintdetprod(oDatos){
		var oNodoDiv = $('#catalogo');
		var oDatos;
		var sError = "";
		var oCretArtc;
		var oCretAdd1,oCretAdd2,oCretAdd3,oRepl;

				if (oDatos !== null){
					if (oNodoDiv != null){
						if (oDatos.success){
                            
                            oNodoDiv.empty();

                            oCretArtc = $('<div/>').attr('class','infoproducto');
							oNodoDiv.append(oCretArtc);
                            
                            oCretAdd2 = $('<div/>').attr('id','imagenProducto');
                            oCretArtc.append(oCretAdd2);
                            
                            oCretAdd3 = $('<img/>').attr('src',oDatos.oProducto.sImg);
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd2 = $('<div/>').attr('id','detallesProducto');
                            oCretArtc.append(oCretAdd2);

							oCretAdd3 = $('<h1/>').text(oDatos.oProducto.sNomProducto);
                            oCretAdd2.append(oCretAdd3);
                            
                            oCretAdd3 = $('<h2/>').text("$"+oDatos.oProducto.nPrecio+".00");
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd3 = $('<img/>').attr('src',"media/tarjetas.png");
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd2.append($('<br/>'));
                            oCretAdd2.append($('<br/>'));

                            oCretAdd3 = $('<img/>').attr('src',"media/auto.png");
                            oCretAdd2.append(oCretAdd3);

							oCretAdd2.append($('<br/>'));
                            oCretAdd2.append($('<br/>'));

                            oCretAdd3 = $('<p/>').text("Talla: "+oDatos.oProducto.sTallas);
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd2.append($('<br/>'));
                            
                            oCretAdd3 = $('<p/>').text("Tamaño: "+oDatos.oProducto.sTamanos);
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd2.append($('<br/>'));
                            
                            oCretAdd3 = $('<p/>').text("Color: "+oDatos.oProducto.sColores);
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd2.append($('<br/>'));
                            
                            oCretAdd3 = $('<p/>').text("Tipo: "+oDatos.oProducto.sTipo);
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd2.append($('<br/>'));
                            
                            oCretAdd3 = $('<p/>').text("Equipo: "+oDatos.oProducto.sEquipo);
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd2.append($('<br/>'));
                            
                            oCretAdd3 = $('<p/>').text("Disciplina: "+oDatos.oProducto.sDisciplina);
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd2.append($('<br/>'));
                            
                            oCretAdd3 = $('<p/>').text("Genero: "+oDatos.oProducto.sGenero);
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd2.append($('<br/>'));
                            
                            oCretAdd3= $('<form/>').attr({
                                id:"infoProductoForm",
                                onsubmit:'performact('+oDatos.oProducto.nCveProd+',"'+oDatos.oProducto.sNomProducto+'",'+oDatos.oProducto.nPrecio+',1);return false;'
                            });
                            oCretAdd2.append(oCretAdd3);

                            oCretAdd1 = $('<input/>').attr({
                                id:"productoAgregaSubmit",
                                type:"submit",
                                value:"Agregar al carrito"
                            });
                            oCretAdd3.append(oCretAdd1);
                             
						}else{
							//Error "de negocio"
							sError = oDatos;
							oNodoDiv.innerHTML = '<h4>'+textoRespuesta+'</h4>';
						}
					}else{
						//Error "de codificación" (no encontró el nodo)
						sError = "Problemas en HTML";
					}
				}else{
					//Error en JSON
					sError = "Error al recibir la respuesta del servidor";
				}
			if (sError != "")
				alert(sError);
		}

        function performact(nCve, sNombr, nPrec, nCant){
            var sURL = 'control/ctrlCarrito.php';
            var llamada=$.post(
                sURL,
                {
                    id_prod:nCve,
                    prod_qty:nCant
                }, 
                function(oDatos) {
                    alert(oDatos.Description);
                }
            ); 
            llamada.fail(function(objRequest, status){
                alert("Error al invocar al servidor, intente posteriormente");
                console.log(status);
            });
        }