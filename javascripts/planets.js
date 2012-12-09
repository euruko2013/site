// WebKitCSSMatrix support is REQUIRED (for translate3d and webkitFilter)
if ('WebKitCSSMatrix' in window && 'm11' in new WebKitCSSMatrix()) {
  // Helper function
  var rand = function(from, to) {
    return Math.random() * (to - from) + from;
  };

  // Helper function
  var round = function(number, precision) {
    precision = typeof precision !== 'undefined' ? precision : 0;
    var powerOf10 = Math.pow(10, precision);
    return Math.round(number * powerOf10) / powerOf10;
  };

  var Planet = function(radius, color, period, xRadius, yRadius, inclination, phase) {
    // Store trajectory related variables
    this.period = period;
    this.xRadius = xRadius;
    this.yRadius = yRadius;
    this.inclination = inclination;
    this.phase = phase;
    this.radiusExageration = 0;

    // Create element
    this.element = document.createElement('div');
    this.element.style.position = 'absolute';
    this.element.style.top = '390px';
    this.element.style.left = '50%';
    this.element.style.width = radius + 'px';
    this.element.style.height = radius + 'px';
    this.element.style.borderRadius = radius + 'px';
    this.element.style.marginTop = - radius / 2 + 'px';
    this.element.style.marginLeft = - radius / 2 + 'px';
    this.element.style.backgroundColor = color;
    this.element.style.webkitFilter = 'blur(5px)';

    // Position before showing
    this.updatePosition();

    // Get or create container
    var container = document.getElementById('planets_container');
    if (container == null) {
      container = document.createElement('div');
      container.id = 'planets_container';
      document.getElementsByTagName('body')[0].appendChild(container);
    }

    // Add planet to DOM
    container.appendChild(this.element);
  };

  Planet.prototype.updatePosition = function() {
    // Calculate position
    var arc = new Date().getTime() % this.period / this.period * 360 + this.phase;
    var x = Math.cos(arc * 2 * Math.PI / 360) * (this.xRadius + (this.radiusExageration * this.xRadius));
    var y = Math.sin(arc * 2 * Math.PI / 360) * (this.yRadius + (this.radiusExageration * this.yRadius));

    // Add some inclination to the trajectory
    var angle = this.inclination * Math.PI / 360;
    var realX = x * Math.cos(angle) - y * Math.sin(angle);
    var realY = x * Math.sin(angle) + y * Math.cos(angle);

    // Move!
    this.element.style.webkitTransform = 'translate3d(' + realX + 'px, ' + realY + 'px, 0)';
  };

  Planet.random = function () {
    var radius = rand(20, 60);
    var shade = round(rand(180, 230));
    var color = 'rgb(' + shade + ', ' + shade + ', ' + shade + ')';
    var xRadius = rand(200, 800);
    var yRadius = rand(100, (xRadius / 800) * 300);
    var inclination = rand(-15, 15) - 24;
    var phase = rand(0, 360);
    var period = Math.sqrt(Math.pow(xRadius, 3) * 200);

    return new Planet(radius, color, period, xRadius, yRadius, inclination, phase);
  };

  // Create 20 random planets
  var planets = [];
  for (var i = 0; i < 15; i++) {
    planets[i] = Planet.random();
  }

  // Cryptic Code follows
  var mouseDistanceFromCenter = 0,
      normalizedMouseDistanceFromCenter = 0;

  window.onmousemove = function (event) {
    mouseDistanceFromCenter = round(Math.sqrt(Math.pow(event.pageX - document.body.offsetWidth / 2, 2) + Math.pow(event.pageY - 390, 2)), 2);
  };

  // Animation Loop
  setInterval(function() {
    // Cryptic Code follows
    if (mouseDistanceFromCenter != normalizedMouseDistanceFromCenter) {
      var distanceDiff = mouseDistanceFromCenter - normalizedMouseDistanceFromCenter;
      if (Math.abs(distanceDiff) < normalizedMouseDistanceFromCenter * 0.005) {
        normalizedMouseDistanceFromCenter = mouseDistanceFromCenter;
      } else {
        normalizedMouseDistanceFromCenter = round(normalizedMouseDistanceFromCenter + distanceDiff * 0.05, 2);
      }
    }

    planets.forEach(function(bubble) {
      bubble.radiusExageration = normalizedMouseDistanceFromCenter / 1500;

      // Animated update planet position
      bubble.updatePosition();
    });
  }, 30);
}
