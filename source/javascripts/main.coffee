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

  # Countdown for first ticket batch
  countdown_container = $('.countdown')
  if countdown_container.length > 0
    counter = countdown_container.find('.counter')
    countdown_end = new Date(counter.data('countdown-end'))
    if countdown_end > new Date()
      countdown(countdown_end, (ts) ->
        counter.html(ts.toHTML("strong"));
        return
      countdown.DAYS|countdown.HOURS|countdown.MINUTES|countdown.SECONDS)
    else
      counter.html('Begone!')
      countdown_container.find('.date').hide();

  # Link to eventora for tickets tracking
  $('#tickets a.eventora-page').on 'click', (event) ->
    _gaq.push(['_trackEvent', 'Tickets', 'Clicked on eventora link']);
    return