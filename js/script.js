  /**
  Creates submenu under the currently active homework using deck.js top level, labeled, slides
  Also sets on click functions for the "quick key" buttons
  **/

  $(function() {
    $.deck('.slide');    
    $(parent.top).ready(function() {

    var clicked;
    var submenu = top.document.getElementById("submenu"); //should be null unless page is reloaded
    var open = true; //submenu open/closed
    var active_homework = top.$(".hw-menu .active li");

  var button = top.$(".quick");
  var iframe = top.document.getElementsByClassName("deck-frame")[0];

  button.click(function(){
    //if ($(this).getAttribute(id).equals("fullScreen")) { iframe.fullScreen(); return; }
    var action = parseInt($(this).val());  
    console.log("button press" + action);
   iframe.contentWindow.focus();

    if(action == 71){
      console.log("goto");
      $.deck("toggleGoTo");
    }
    else if(action == 77){
      $.deck("toggleMenu");
    }
    else if(action == 84){
      $.deck("toggleScale");
    }
    else {
          var e = jQuery.Event("keydown");
    //e.which = action; // # Some key code value
    //e.keyCode = action;
    e.which = action; //but only works for arrows for some reason..
    e.keyCode = action;
    $(document).trigger(e);

    }
    

  });


  try {
    menu_ul = top.$(".hw-menu");
  // menu_children = menu_ul.getElementsByTagName("*");
}
catch(e) {
  alert("error :/ " + e);
}

  createSubmenu(submenu, active_homework);


(active_homework).click(function() {
  //remove the submenu
  if(open) {
    console.log("hiding");
    //submenu.css("display", "none");
    top.$(".hw-menu .active #submenu a li h6").hide("slide", { direction: "down" }, 1000, function(){
       top.$(".hw-menu .active #submenu").css("display", "none");
     // submenu.hide();
    });
    open = false;
  } 
  else {
  //  submenu.show();
  console.log("showing");
  open = true;
   top.$(".hw-menu .active #submenu").show(function(){
    
    top.$(".hw-menu .active #submenu a li h6").show("slide", { direction: "down" }, 1000);
    //submenu.show();
  });
  }

}); //active hw clicked*/
  }); //parent.ready



  function createSubmenu(submenu, active_homework) {
    open = true;
    console.log("creating submenu");
    if(submenu != null) { 
      console.log("was submenu" + submenu + submenu.length);
      return;
    }
    submenu = document.createElement("div"); //wrapper for table of contents in sidebar
    submenu.setAttribute("id", "submenu");
    submenu.setAttribute("class", "submenu");

        /*submenu.css({
        "background-color": "blue",
        "font-size": "12",
        "margin-top": "-50px"
      });*/

        //menu_ul.empty();
        //menu_ul.hide();

        $.each($.deck('getSlides'), function(i, $slide) {
          var id = $slide.attr('id');

        //create link for section using the id of the section
        var slide_a = document.createElement("a");
        var slide_li = document.createElement("li");
        slide_li.setAttribute("class", "submenu-li");
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

        active_homework.append(submenu);
      }

    });
