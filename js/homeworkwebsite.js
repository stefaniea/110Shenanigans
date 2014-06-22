jQuery(document).ready(function(){

 console.log("homework website js");

 var iframe = document.getElementsByClassName("deck-frame")[0];


  //after iframe has loaded

  $('iframe').load(function () { 

   

    //var sublink = document.getElementsByClassName("submenu-li");
    $(".submenu-li").click(function(){ //not getting clicked whyyy
      console.log("submenu li was clicked");
      console.log("this is:" + $(this));
      var slide = $(this).children(":first").text(); //<li><h6>title of slide</h6><li> 
      goToSlide(slide);
      

    });

    //console.log("about to call onclick");
    //$(".hw-menu .submenu-li").click();

  });

  resizeIFrame();

  function setClicks(){

  }

  var active = document.getElementsByClassName("active")[0];

  $(".hw-menu a").click(function(){
    var id = $(this).attr("id");
  if($(this).hasClass("active")) return; //already on this hw 
  console.log("id is" + id);
  var hwnum = id.substring(2, id.length); 
  console.log("hw num is " + hwnum);
  console.log("length is" + id.length);
  setCurrentHomework(hwnum);
  resizeIFrame();
});


  function resizeIFrame() {
   //size iframe:
   var width = (.7*$(window).width());
   iframe.style.width =  (width)+'px';
   iframe.style.height =  (width*.75)+'px';

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

  function goToSlide(id) {
    var src = iframe.getAttribute("src");
    var ind = src.indexOf(".html");
    var length = 5;
    src = src.substring(0, ind + length);
    iframe.setAttribute("src", src + "#"+id);
    console.log("go to slide:" + id);
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



