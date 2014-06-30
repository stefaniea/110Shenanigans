jQuery(document).ready(function(){


 console.log("homework website js");
 var bookmark = "#"; //will keep track of page left off on (perhaps store this locally?)

 //navbar hide
  var navbar = $(document.getElementById("header"));
  
//hide navbar
  navbar.css("top", "-60px");

//show navbar on hover
  navbar.mouseenter(function(){
    //navbar.css("top", "0px");
    navbar.animate({
    top: "0px"
  }, {
    duration: 500,
    specialEasing: {
      top: "easeInOutBack"
    },
    complete: function() {
     // $( this ).after( "<div>Animation complete.</div>" );
    }
  });

  });

//hide navbar when person clicks
var panel = $(document.getElementById("frame-wrap"));
  panel.click(function(){
    navbar.animate({
      top: "-60px"
    }, {
      duration: 500,
      specialEasing: {
        top: "linear"
      },
      complete: function() {
       // $( this ).after( "<div>Animation complete.</div>" );
     }
   });
  });

 var iframe = document.getElementsByClassName("deck-frame")[0];

        /**
  Looks at the # in the url, and sets the iframe of this page as that tag
  **/
  function loadIframeFromTag() {
    var html = getTextAfterTag();
    if(html == null) return;
    setFrameAs(html);
  }

  loadIframeFromTag();


  //after iframe has loaded

  $('iframe').load(function () { 

    

    //var sublink = document.getElementsByClassName("submenu-li");
    $(".submenu-li").click(function() { 
      console.log("submenu li was clicked");
      console.log("this is:" + $(this));
      var slide = $(this).children(":first").text(); //<li><h6>title of slide</h6><li> 
      goToSlide(slide);
      
    });

      resizeIFrame();

  });



/*$(".submenu-li h6").mouseenter(function(){
  $(this).hide();
});
*/
  var active = document.getElementsByClassName("active")[0];

  $(".hw-menu a").click(function() { //not getting clicked??? 
    console.log("homework clicked");
    var id = $(this).attr("id");
    if($(this).hasClass("active")) return; //already on this hw 
    console.log("id is" + id);
    var hwnum = id.substring(2, id.length); 
    console.log("hw num is " + hwnum);
    console.log("length is" + id.length);
    setCurrentHomework(hwnum);
    resizeIFrame();
});

$( window ).resize(function() {
  resizeIFrame();
});

  function resizeIFrame() {
   //size iframe:
   var width = (.6*$(window).width());
   iframe.style.width =  (width)+'px';
   iframe.style.height =  (width*.75)+'px';

//minimum
   if(width < 400) {
    width = 400;
    iframe.style.width =  (width)+'px';
    iframe.style.height =  (width*.75)+'px';
  }
}

//where hw is a number between 0 and 10
function setCurrentHomework(hw) {

  if(hw < 0 || hw > 10) {
    console.log("invalid hw");
    alert("something went wrong  :/");
    return;
  }

//todo: catch reference error and test this part:
var hw_src = "hw" + hw + ".html";
var hw_id = "hw" + hw;
var homework_title = "Homework " + hw;
    //change the iframe:
    //iframe.attr("id", hw_id+"-frame");
    iframe.setAttribute("src", hw_src);

    //change the current homework title
    var current = $(".hw-menu #current");
    current.text(homework_title);

    //change the active class
    $(".hw-menu .active").removeClass("active");
    $("#" + hw_id).addClass("active");

  }

  function setFrameAs(file){
    var loc = document.location.href;
    bookmark = iframe.getAttribute("src"); //save current frame source (TODO: local storage maybe)
    //var loc = window.location.href; //**why is file system opening**????
    var dir = loc.substring(0, loc.lastIndexOf("/"));
    console.log("loc"+loc); 
    console.log("dir" + dir);
    console.log("file" + file);
    iframe.setAttribute("src", dir+"/"+file); 
  }

  function goToBookmark() {
    iframe.setAttribute("src", bookmark);
  }

  /*$(".toolbox-link").click(function(){
    console.log("click toolbox");
    var src = $(this).val();
    setFrameAs(src);
  });*/

  function goToSlide(id) {
    var src = iframe.getAttribute("src");
    var ind = src.indexOf(".html");
    var length = 5;
    src = src.substring(0, ind + length);
    iframe.setAttribute("src", src + "#"+id);
    console.log("go to slide:" + id);
  }

  function getTextAfterTag() {
     var src = document.location.href;
     console.log("src"+src);
    var ind = src.indexOf("#");
    if(ind < 0) return null;
    src = src.substring(ind+1, src.length);
    console.log("new src" + src);
    return src;
  }

  console.log("about to make onclick");

  //hide footer buttons
  $("#footer").css("height", "0");

  //show them when hover
  $("#footer").mouseleave(function(){
   $( "#footer" ).animate({
    height: "0"
  }, 400, function() {
    // Animation complete.
  });

 });

//show them when hover
$("#footer").mouseenter(function(){
 $( "#footer" ).animate({
  height: "70"
}, 400, function() {
    // Animation complete.
  });

  });
});



