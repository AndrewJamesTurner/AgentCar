use <clip.scad>


frontWheelConnections(20,20,3,45);




module frontWheelConnections(length1, length2, wheelWidth, angle){
	
	thickness = 3;
	width = 10;

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
			cylinder(h=thickness*1.1, r=4, $fn=20, center=ture);

			rotate([0,0,angle+180]){

				translate([length2,0,0]){
					cylinder(h=thickness*1.1, r=4, $fn=20, center=ture);
				}
			}
		}
	}

    translate([length1 - 5/2 -width/2, 0, thickness/2]){
      rotate([0,90,0]){
        color("Red",0.5) cylinder(h=5, r=10, center=true);
      }
    }
    
    
    translate([length1 -width/2,0,thickness/2]){
      rotate([0,90,0]){
        clip(wheelWidth*1.1, 5);
      }
    
	}
}
}
