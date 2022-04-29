use <circular_array.scad>

// Diameter of the LED holes (mm)
led_dia = 12;

// Diameter of the entire array (mm)
moon_dia = 2400;

// Spacing between the rings (mm)
spacing = 67;

$fs=0.5;
$fa=0.5;

ring_count = floor(moon_dia / (spacing * 2));

circular_array(ring_count = ring_count, radial_spread = spacing)
  circle(d=led_dia);
