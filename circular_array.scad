// The diameter of the dots (mm)
dot_dia = 25;

// Spacing between the rings (mm)
spacing = 50;

// The number of rings, excluding the center.
ring_count = 5;

$fs=0.5;
$fa=0.5;

circular_array(ring_count = ring_count, radial_spread = spacing)
  circle(d=dot_dia);


module circular_array(ring_count = 5, radial_spread = 10, factor = 6) {
  // center one
  children();

  for (i = [1 : ring_count])
    for (rot = [0 : (360/factor)/i : 360])
      rotate(rot)
      translate([0, i * radial_spread])
        children();

  array_count = 6 * ring_count * (ring_count+1) / 2 + 1;
  echo (array_count = array_count);
}

