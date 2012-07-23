include <involute_gears.scad>

gear_unit = 3;

//gear(number_of_teeth=10,circular_pitch=700,gear_thickness = 12);

// 56,37
//translate([0,50,0])cube([40,5,5]);
stepped_thing();
translate([0,56,0])rotate([0,0,12])stepped_thing();
translate([37,0,0])counter();
translate([37,56,0])rotate([0,0,12])counter();

translate([37,56,-10])counterCarryGearFull();
translate([37,0,-10])counterCarryGearSingle();


//translate([-40,0,2.5])rotate([90,0,0])counterAxel();
//translate([-15,22,0])counterGear();
//translate([-15,-20,0])rotate([0,0,-90])counterCarryGearSingle();

//translate([0,0,0])crank();
//translate([-15,-20,-30])counterCounter();
//translate([40,-30,0])counterCarryGearFull();

module crank()union(){
  cube([25,5,5]);
  rotate([0,0,90])translate([0,-25,0])cube([25,5,5]);
  translate([20,20,0])cube([15,5,5]);
}

module counter()translate([0,0,-gear_unit+8*gear_unit]){
  color([1,0,0])counterGear();
  color([0,1,0])counterAxel();
  color([0,0,1])counterCounter();
}

module counterCounter(){
  translate([0,0,6*gear_unit])difference(){
    cylinder(r=20, h=gear_unit);
    for (i = [0:9]){
      rotate([0,0,36*i])translate([14.5,0,gear_unit-1])cylinder(r=5, h=5);
    }
    cube([5,5,200],center=true);
  }
}

module counterCarryGearFull()difference(){
  gear(number_of_teeth=10, gear_thickness=gear_unit,rim_thickness=gear_unit,hub_thickness=gear_unit,circular_pitch=950);
  cube([5,5,200],center=true);
}

module counterCarryGearSingle(){
  rotate([0,0,125])difference(){
    gear(number_of_teeth=10, gear_thickness=gear_unit,rim_thickness=gear_unit,hub_thickness=gear_unit,circular_pitch=950);
    for (i = [0 : 8] ) {
      rotate([0,0,36*i])translate([20,-5,-5])cube([40,10,300]);
    }
    cube([5,5,200],center=true);
  }
}

module counterGear(){ 
  difference(){
    union(){
      gear(number_of_teeth=10, gear_thickness=gear_unit*.8,rim_thickness=gear_unit*.8,hub_thickness=gear_unit*.8,circular_pitch=600);
      cylinder(r=8,h=10);
    }
    cube([5,5,200],center=true);
  }
}
module counterAxel(){
  cube([5,5,gear_unit*20],center=true);
}

module stepped_thing(){
  difference(){
    union(){
      gear(number_of_teeth=16, gear_thickness=gear_unit,rim_thickness=gear_unit,hub_thickness=gear_unit,circular_pitch=600);
      difference(){
        gear(number_of_teeth=10, gear_thickness=13*gear_unit,rim_thickness=13*gear_unit,hub_thickness=13*gear_unit,circular_pitch=600);
        for (i = [0 : 8] ) {
          rotate([0,0,36*i])translate([0,-5,(11.5*gear_unit)-(i*gear_unit)])cube([40,10,300]);
        }
        rotate([0,0,36*9])translate([0,-5,0])cube([40,10,300]);
      }
      cylinder(r=15, h=13*gear_unit);
      translate([0,0,0])cylinder(r=5/2, h=15*gear_unit); 
    }
    translate([-2.5,-2.5,0])cube([5.5,5.5,20]);
  }
}