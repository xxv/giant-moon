use <circular_array.scad>


// Diameter of the LED holes (mm)
led_dia = 12;

// Diameter of the entire array (mm)
moon_dia = 2300;

// Spacing between the rings (mm)
spacing = 65;

$fs=0.5;
$fa=0.5;

ring_count = floor(moon_dia / (spacing * 2));

mockup();

module mockup() {
  material_thickness = 4;

  color("red")
    linear_extrude(height=material_thickness)
      left_panel();

  color("blue")
    linear_extrude(height=material_thickness)
      right_panel();
}


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
    translate([spacing/2, -moon_dia/2])
      square([moon_dia, moon_dia]);
  }
}

module right_backing() {
  difference() {
    circle(d=moon_dia);
    translate([-moon_dia + spacing/2, -moon_dia/2])
      square([moon_dia, moon_dia]);
  }
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
