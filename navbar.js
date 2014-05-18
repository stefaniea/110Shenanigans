$(document).ready(function(){

	$("#menu").hide();
	var jPM = $.jPanelMenu({
       keyboardShortcuts: [], //get rid of keyboard shortcuts
       excludedPanelContent: ".deck-container"
		

	});

	jPM.on();


	$('.slide').css("margin-top", "80px");


	/*var jPM = $.jPanelMenu({
    menu: '#custom-menu-selector',
    trigger: '.custom-menu-trigger-selector'
});*/




	/*$(".dropdown_menu ul").hide();
	$(".menu_wrapper").click(function(){
		$(this).find(".dropdown_menu ul").get.slideToggle();
	});*/
});