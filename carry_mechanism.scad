include <involute_gears.scad>
//$t=0.3;
gear_unit = 3;

translate([0,0,gear_unit])rotate([0,0,18+($t*36)])gear(number_of_teeth=10, gear_thickness=gear_unit,rim_thickness=gear_unit,hub_thickness=gear_unit,circular_pitch=600);
translate([0,56,0])rotate([0,0,18])gear(number_of_teeth=10, gear_thickness=gear_unit,rim_thickness=gear_unit,hub_thickness=gear_unit,circular_pitch=600);


translate([0,56,0])rotate([0,0,-5+$t*8]){
  translate([-.5,-30,gear_unit*2])color([])cube([1,30,gear_unit]);
  translate([-.5,-30,-gear_unit])color([])cube([1,30,gear_unit]);
  translate([0,-30,-gear_unit])color([])cylinder(h=gear_unit*4,r=1);
}
translate([0,56,0])rotate([0,0,170+$t*8])translate([-3,30,gear_unit])rotate([0,0,40-110*$t])paddle();
translate([0,23.5,gear_unit])color([1,0,0]){
  cylinder(r=.5,h=gear_unit);
  translate([0,-.5,0])cube([4,1,gear_unit]);
}
module paddle()color([0,1,0]){
  translate([0,0,gear_unit/2])cube([1,26,gear_unit*.8], center=true);
  cylinder(r=2,h=gear_unit);
}
