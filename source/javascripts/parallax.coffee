$ ->
  window_width = $(window).width()
  window_height = $(window).height()
  strength = [15, 40, 50, 15]
  width = []
  height = []

  for i in [0..4]
    width.push(strength[i] / window_width)
    height.push(strength[i] / window_height)

  $("body").on 'mousemove', (e) ->
    newPositionX = [];
    newPositionY = [];
    myPageX = e.pageX - (window_width/2);
    myPageY = e.pageY - (window_height/2);
    for i in [0..4]
      newPositionX.push(myPageX * width[i] * (-1))
      newPositionY.push(myPageY * height[i] * (-1))

    newRule = newPositionX[0] + "px " + newPositionY[0] + "px, " + newPositionX[1] +
              "px " + newPositionY[1]+"px, " + newPositionX[2]+"px " + newPositionY[2] +
              "px, " + newPositionX[3]+"px " + newPositionY[3]+"px"

    $("#introduction .centered").css("background-position", newRule)
    return false
