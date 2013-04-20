$ ->

  navbar_opacity = () ->
    if $(window).scrollTop() != 0
      $("#nav").css("background-color", "rgba(245,245,245,1)")
      $("#nav").css("border-bottom", "1px solid #ccc")
    else
      $("#nav").css("background-color", "rgba(255,255,255,0.5)")
      $("#nav").css("border-bottom", "none")
    return

  navbar_opacity()

  # Smooth scrolling
  $(window).scroll ->
    navbar_opacity()
    return false

   $('#nav a, #news a').on 'click', (event) ->
      $anchor = $(this)

      $('html, body').stop().animate({
          scrollTop: $($anchor.attr('href')).offset().top - $('#nav').height() - 24
      }, "normal")
      return false

  $('.back_top').on 'click', (event) ->
    $("html, body").animate({ scrollTop: 0 }, "normal");
    return false;

  # Sponsors brochure tracking
  $('#sponsors a.brochure').on 'click', (event) ->
    _gaq.push(['_trackEvent', 'Sponsors', 'Brochure Download']);
    return

  # Newsletter signup tracking
  $('#mc_embed_signup form').on 'submit', (event) ->
    _gaq.push(['_trackEvent', 'Newsletter', 'Signup']);
    return

  # Organisers tooltip on mouserOver

  $('.organisers-avatar').powerTip
    placement: 'n',
    smartPlacement: true
    mouseOnToPopup: true
