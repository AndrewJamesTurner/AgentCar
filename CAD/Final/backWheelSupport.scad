$fn = 100;
backWheelSupport();


module backWheelSupport(){


  translate([0,0,1.5]){

    difference(){ 

      union(){

        cube([10,30,3], center=true);
        cube([30,10,3], center=true);
      }

      rotate([180,0,0]){
      
        translate([-10,0,-2]){
          cylinder(h=2, r=3);
        }

        translate([10,0,-2]){
          cylinder(h=2, r=3);
        }

        translate([0,-10,-2]){
          cylinder(h=2, r=3);
        }

        translate([0,10,-2]){
          cylinder(h=2, r=3);
        }

        translate([-10,0,0]){
          cylinder(h=2, r=1);
        }

        translate([10,0,0]){
          cylinder(h=2, r=1);
        }

        translate([0,-10,0]){
          cylinder(h=2, r=1);
        }

        translate([0,10,0]){
          cylinder(h=2, r=1);
        }
      }
    }
  }

  translate([0,0,3+5]){
    difference(){
      cube([10,10,10],center=true);
      
        rotate([0,90,0]){
          cylinder(h=12, r=2.05,center=true);
        }
      }
  }
}

