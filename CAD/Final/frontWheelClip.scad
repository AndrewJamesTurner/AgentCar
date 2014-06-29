
use <clip.scad>

frontWheelClip(7,4);

module frontWheelClip(clipLength,clipRadius){

	difference(){

		union(){
      translate([0,0,1.5]){
        cube([10,30,3], center=true);
        cube([30,10,3], center=true);
      }
		}

    translate([-10,0,1.5]){
      cylinder(h=1.5, r=3, $fn=20);
    }

    translate([10,0,1.5]){
      cylinder(h=1.5, r=3, $fn=20);
    }

    translate([0,-10,1.5]){
      cylinder(h=1.5, r=3, $fn=20);
    }

    translate([0,10,1.5]){
      cylinder(h=1.5, r=3, $fn=20);
    }

    translate([-10,0,0]){
      cylinder(h=1.5, r=1, $fn=20);
    }

    translate([10,0,0]){
      cylinder(h=1.5, r=1, $fn=20);
    }

    translate([0,-10,0]){
      cylinder(h=1.5, r=1, $fn=20);
    }

    translate([0,10,0]){
      cylinder(h=1.5, r=1, $fn=20);
    }
	}

	translate([0,0,3]){
    clip(clipLength,clipRadius);
	}
}
