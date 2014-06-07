$(document).ready(function(){


 // console.log("document read");

//submenus:
var menu_ul = $(".menu ul");

//menu items (homework 1, homework 2, etc.)
$(".menu_ul a").mouseenter(function() {
  console.log("mouse entered");
  if (this.attr('id').equals("hw2")) {
    //remove all current children of menu
    menu.empty(); 


  //  var iframe = $('iframe').contents().find('').html();

  //
  $.each($.deck('getSlides'), function(i, $slide) {
    console.log("another slide");
    var id = $slide.attr('id');
      //create link for section using the id
      var slide_a = document.createElement("a");
      var slide_li = document.createElement("li");
      var slide_header = document.createElement("h4");
      slide_header.html(id);
      slide_a.append(slide_li);
      slide_li.append(slide_header);

      if (id) {
        if(id.indexOf("slide") == -1) /*added this b/c countNested wasn't working.  Instead, checking if slide id has the word slide in it */
          $menu_ul.append(slide_a);
      }
    }

  }

});
});


  //$.deck('go', isNaN(index) ? indexOrId : index - 1);

/*
//collapsable question/answers
$(".answer").hide();


$(".question").click(function() {
  $(this).children().find(".answer").toggle();
});
*/