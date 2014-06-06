$(document).ready(function(){

	$("#menu").hide();
	var jPM = $.jPanelMenu({
       keyboardShortcuts: [], //get rid of keyboard shortcuts
       excludedPanelContent: ".deck-container"


     });

	jPM.on();


	$('.slide').css("margin-top", "80px");

	$.extend(true, $.deck.defaults, {
   classes: {
    goto: 'deck-goto'
  },

  selectors: {
    gotoForm: '.goto-form',
    gotoInput: '#goto-slide'
  },

  keys: {
      goto: 71 // 'g'
    },

    countNested: false
  });


  $(".answer").hide();

//collapsable question/answers
$(".question").click(function() {
  $(this).children().find(".answer").toggle();
});


});