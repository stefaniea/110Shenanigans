$(function() {
  $.deck('.slide');

  //homework 2 active:
 // top.$("#hw2").style.color = "orange";

  var menu_ul;
  var menu_children;
  var clicked;
  var submenu;
  var open = false;




  try {
    menu_ul = top.$(".hw-menu");
   // menu_children = menu_ul.getElementsByTagName("*");
 }
 catch(e) {
  alert("error :/ " + e);
}

$(parent.top).ready(function() {


  top.$(".hw-menu .active li").click(function() {

    

  //remove all submenus
 // top.$(".hw-menu a li").remove("div");
  if(open) {
    submenu.remove();
    open = false;
  } 

else {
  open = true;
    clicked = $(this);
    submenu = document.createElement("div");

 //menu_ul.empty();
 //menu_ul.hide();

 $.each($.deck('getSlides'), function(i, $slide) {
  var id = $slide.attr('id');

      //create link for section using the id
      var slide_a = document.createElement("a");
      var slide_li = document.createElement("li");
      slide_li.style.height = "10px";
      slide_a.style.height="10px";
      var slide_header = document.createElement("h6");
      slide_header.innerHTML = id;
      slide_a.appendChild(slide_li);
      slide_li.appendChild(slide_header);

      if (id) {
        if(id.indexOf("slide") == -1) { /*added this b/c countNested wasn't working.  Instead, checking if slide id has the word slide in it */
          //clicked.appendChild(slide_a);
          submenu.appendChild(slide_a);
         return;
       }
     }

   });

    clicked.append(submenu);
  }

});

   top.$(".hw-menu a li").mouseleave(function(){
 // menu_ul.append(menu_children);
 //alert("mouseleave")
  //document.reload();
  if(submenu) submenu.remove();

  
});



});





});