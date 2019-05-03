$(document).ready(function() {
	$("input[type=submit]").button();
	$("input").focus(function(){
		$(this).css("border-style","thick");
		$(this).css("border-color","#4D4DEE");
	});
	$("input").blur(function(){
		$(this).css("border-style","");
		$(this).css("border-color","");
	});
	$(".selectable").selectmenu();
});