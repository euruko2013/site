//first
$(document).ready(function(){
  var window_width = $(window).width();
  var window_height = $(window).height();
  var strength = [15, 40, 50, 15];
  var width = [];
  var height = [];

  for(var i=0;i<4;i++){
    width.push(strength[i] / window_width);
    height.push(strength[i] / window_height);
  };
  $("body").mousemove( function(e){
    var newPositionX = [];
    var newPositionY = [];
    var myPageX = e.pageX - (window_width/2);
    var myPageY = e.pageY - (window_height/2);
    for (var i =0; i < 4; i++) {
      newPositionX.push(myPageX * width[i] * (-1));
      newPositionY.push(myPageY * height[i] * (-1));
    };
    var newRule = newPositionX[0] + "px " + newPositionY[0] + "px, "+ newPositionX[1] +"px "+newPositionY[1]+"px, "+newPositionX[2]+"px "+newPositionY[2]+"px, "+newPositionX[3]+"px "+newPositionY[3]+"px";
    $("#introduction .centered").css("background-position", newRule);
  });
});