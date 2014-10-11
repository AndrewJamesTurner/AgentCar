use <clip.scad>

$fn=100;

carWidth = 130;
carLength = 200;
carThickness = 8;

wheelHeight = 40;
wheelWidth = 3;

wheelConnect = 20;
wheelConnect2 = 15;

frontToFrontWheels = 40;
frontClipFromSide = 15;
backToBackWheels = 40;
angle = atan( (carLength-frontToFrontWheels-backToBackWheels) / ((carWidth/2)-frontClipFromSide));

frontWheelConnections(wheelConnect+frontClipFromSide, wheelConnect2, wheelWidth, angle);

module frontWheelConnections(length1, length2, wheelWidth, angle){
	
	thickness = 3;
	width = 12;

  translate([0,0,0]){

	difference(){

		union(){


			translate([-width/2,-width/2, 0]){
				color("Blue",0.5) cube([length1, width, thickness]);
			} 

			translate([0 ,0,0]){

				rotate([0,0,angle+180]){
			
					translate([-width/2,-width/2,0]){

						color("Blue",0.5) cube([length2+(width), width, thickness]);
					}
				}
			}
		}

		translate([0,0,0]){
			cylinder(h=thickness*1.1, r=4, center=ture);

			rotate([0,0,angle+180]){

				translate([length2,0,0]){
					cylinder(h=thickness*1.1, r=4, center=ture);
				}
			}
		}
	}

    translate([length1 - 3/2 -width/2, 0, thickness/2]){
      rotate([0,90,0]){
        color("Red",0.5) cylinder(h=3, r=10, center=true);
      }
    }
    
    
	translate([length1 -width/2,0,thickness/2]){
    	rotate([0,90,0]){
			cylinder(h=thickness+2.5, r=4.95, center=ture);
      	}
    
	}
}
}
