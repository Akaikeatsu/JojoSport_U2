function ProsPinSelector(textoRespuestaFill){
        var oNodoFill =$('#catalogo');
        var sError = "";
        var oCretAdd1;
        var oFilter,oOption;

        var form;
        var filter1,filter2;
        var option;


                    if (oNodoFill != null){
                        if (textoRespuestaFill.success){							
                            /* FILTRADO*/
                        form=$('<form/>').atrr({
                            class:'MenuFill',
                            onsubmit:'pintaFiltrado(); return false;'
                        });
                        form.insertBefore($('#container'));

                        filter1 = $('<select/>').attr({
                            id:'filter1',
                            onchange: function(){

                            }
                        });
                        oFilter.id="filter1";
                        oFilter.onchange=function(){
                            var ofill;
                            var oOption;
                            oFilter = $('#filter2');
                            ofill = $('<select/>').attr('id','filter2');
                            oFilter.replaceWith(ofill);
                            var selectBox = $('#filter1');
                            var selectedValue = selectBox.options[selectBox.selectedIndex].value;	

                            if(selectedValue == "sEquipo"){
                                for(var i=0; i< textoRespuestaFill.arrEquipo.length; i++){
                                var oOption = $('<option/>').attr("text",textoRespuestaFill.arrEquipo[i].sEquipo);
                                ofill.append(oOption);}
                            
                            }else if(selectedValue == "sDisciplina"){
                                for(var i=0; i< textoRespuestaFill.arrDisciplina.length; i++){
                                    oOption = document.createElement("option");
                                    oOption.text = textoRespuestaFill.arrDisciplina[i].sDisciplina;
                                    ofill.append(oOption);

                                }
                            }
                        }
                        
                        form.append(oFilter);

                        oOption = document.createElement("option");
                        oOption.text = "Equipo";
                        oOption.value = "sEquipo";							
                        oFilter.append(oOption);

                        oOption = document.createElement("option");
                        oOption.text = "Disciplina";
                        oOption.value = "sDisciplina";							
                        oFilter.append(oOption);

                        oFilter = document.createElement("select");
                        oFilter.id="filter2";
                        oCretAdd1.append(oFilter);

                        for(var i=0; i< textoRespuestaFill.arrEquipo.length; i++){
                            oOption = document.createElement("option");
                            oOption.text = textoRespuestaFill.arrEquipo[i].sEquipo;
                            oFilter.append(oOption);}
                        
                        oFilter = document.createElement("input");
                        oFilter.className="Filtrado"
                        oFilter.type = "submit";
                        oCretAdd1.append(oFilter);							
                        /*FILTRADO */
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