// Smooth scrolling
$(function() {
  $(window).scroll(function() {
    if($(window).scrollTop() != 0) {
      $("#nav").css("background-color", "rgba(245,245,245,1)");
    }
    else {
      $("#nav").css("background-color", "rgba(255,255,255,0.4)");
    }
  });

  $('#nav a, #news a').bind('click', function(event) {
      var $anchor = $(this);

      $('html, body').stop().animate({
          scrollTop: $($anchor.attr('href')).offset().top - $('#nav').height() - 24
      }, "normal");

      return false;
  });

  $('.back_top').bind('click', function(event) {
    $("html, body").animate({ scrollTop: 0 }, "normal");
    return false;
  });
});

// Sponsors brochure tracking
$(function() {
  $('#sponsors a.brochure').bind('click', function(event) {
    _gaq.push(['_trackEvent', 'Sponsors', 'Brochure Download']);
  });
});
