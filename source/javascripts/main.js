// Smooth scrolling
$(function() {
  $('#nav a, #news a').bind('click', function(event) {
      var $anchor = $(this);

      $('html, body').stop().animate({
          scrollTop: $($anchor.attr('href')).offset().top
      }, "normal");

      return false;
  });

  $('.back_top').bind('click', function(event) {
    $("html, body").animate({ scrollTop: 0 }, "normal");
    return false;
  });
});
