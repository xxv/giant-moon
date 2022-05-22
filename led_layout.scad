use <circular_array.scad>

// Diameter of the LED holes (mm)

//led_dia = 12;

// 1/4" pilot holes
led_dia = 6.35;

// Diameter of the entire array (mm)
moon_dia = 2300;

// Spacing between the rings (mm)
spacing = 65;

$fs=0.5;
$fa=0.5;

ring_count = floor(moon_dia / (spacing * 2));


module left_panel() {
  difference() {
    left_backing();

    led_holes();
  }
}

module right_panel() {
  difference() {
    right_backing();

    led_holes();
  }
}

module led_holes() {
  circular_array(ring_count = ring_count, radial_spread = spacing)
    circle(d=led_dia);
}

module left_backing() {
  difference() {
    circle(d=moon_dia);
    translate([0, -moon_dia/2])
    square([moon_dia, moon_dia]);

  translate([0, -spacing * ring_count])
    line_of_teeth(spacing, ring_count);
  }

  mirror([1, 0])
    translate([0, -spacing * (ring_count - 1)])
      line_of_teeth(spacing, ring_count - 1);
}

module right_backing() {
  difference() {
    circle(d=moon_dia);
    translate([-moon_dia, -moon_dia/2])
    square([moon_dia, moon_dia]);

  mirror([1, 0])
    translate([0, -spacing * (ring_count - 1)])
      line_of_teeth(spacing, ring_count - 1);
  }

  translate([0, -spacing * ring_count])
    line_of_teeth(spacing, ring_count);
}

module line_of_teeth(spacing, count) {

    for (i = [0: count])
    translate([0, spacing * i * 2])
    rotate([0, 0, 90])
      translate([ -spacing/2, 0])
        tooth_cutout(spacing);
}

module tooth_cutout(spacing) {
  polygon(points = [
      [0, 0],
      [spacing/3, spacing/3],
      [spacing * (2/3), spacing/3],
      [spacing, 0],
    ]);
}
