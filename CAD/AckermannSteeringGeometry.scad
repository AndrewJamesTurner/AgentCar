carWidth = 100;
carLength = 150;
carThickness = 2.5;

wheelHeight = 30;
wheelWidth = 5;

wheelConnect = 12;
wheelConnect2 = 20;

buffer = 15;

angle = 60;

distanceDueToAngle = sin(angle)*wheelConnect2; // needs calculating
WidthOfSorterStrut = -buffer+carWidth-(2*cos(angle)*wheelConnect2); // needs calculating


translate([0,0,0.4]){
	color("Orange",0.2) cube([carWidth, carLength, carThickness], center=true);
}

for (i = [0, 1]){

	mirror([ i, 0, 0 ]){

		// front wheels
		translate([(wheelConnect) + (carWidth/2), -buffer+(carLength/2), -carThickness-3]){
			wheel(wheelWidth, wheelHeight);
		}	

		// rear wheels
		translate([(wheelConnect) + (carWidth/2) , buffer-(carLength/2), -carThickness-3]){
			//wheel(wheelWidth, wheelHeight);
			wheelBack(wheelWidth, wheelHeight);
		}
	
		translate([(carWidth/2)-buffer, -buffer+(carLength/2), -carThickness-3]){
			frontWheelConnections(wheelConnect, wheelConnect2, buffer, wheelWidth, angle);
		}

		// front wheel clips
		translate([(carWidth/2)-buffer, -buffer+(carLength/2),-carThickness]){
			frontWheelClip(9);
		}

		translate([(carWidth/2)-buffer,buffer-carLength/2,-carThickness]){
			backWheelSupport();
		}


		translate([(WidthOfSorterStrut/2)-buffer/2, -buffer+(carLength/2)-distanceDueToAngle,-carThickness-4.5]){
			doubleClip(6,2);
		}
		

	}	

	// rear axel
	translate([0,buffer-carLength/2,-carThickness-3]){
		rearAxel(2, (carWidth) + (wheelConnect*2) + wheelWidth);
	}


	//
	translate([0,-buffer+carLength/2,-carThickness-6]){
		frontWheelStrut1(-buffer+carWidth, buffer, 2);
	}


	translate([0,-buffer+(carLength/2)-distanceDueToAngle,-carThickness-6]){
		frontWheelStrut1(WidthOfSorterStrut, buffer, 2);
	}	


	translate([0,0,0]){
		// frontWheelClip();
	}


	translate([0,(-buffer + carLength)/2, -carThickness]){
		servoBracket();
	}

}



module servoBracket(){

	
		cube([40,15,3], center=true);
	

}



module backWheelSupport(){

	difference(){
		
		translate([0,0,-3]){
			
			cube([5,5,5], center=true);
		}

		translate([0,0,-3]){
		
			rotate([0,90,0]){
				cylinder(h=10, r=1.1, $fn=20, center=true);
			}
		}

	}


	difference(){

		union(){

			cube([5,20,3], center=true);
			cube([20,5,3], center=true);
		}

		rotate([180,0,0]){
		
			translate([-7,0,0]){
				cylinder(h=5*1.1, r=2, $fn=20);
			}

			translate([7,0,0]){
				cylinder(h=5*1.1, r=2, $fn=20);
			}

			translate([0,-7,0]){
				cylinder(h=5*1.1, r=2, $fn=20);
			}

			translate([0,7,0]){
				cylinder(h=5*1.1, r=2, $fn=20);
			}

			translate([-7,0,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([7,0,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([0,-7,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([0,7,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}
		}
	}
}



module frontWheelClip(height){

	clipLength = height;
	clipRadius = 2;
	
	difference(){

		union(){

			cube([5,20,3], center=true);
			cube([20,5,3], center=true);
		}

		rotate([180,0,0]){
		
			translate([-7,0,0]){
				cylinder(h=5*1.1, r=2, $fn=20);
			}

			translate([7,0,0]){
				cylinder(h=5*1.1, r=2, $fn=20);
			}

			translate([0,-7,0]){
				cylinder(h=5*1.1, r=2, $fn=20);
			}

			translate([0,7,0]){
				cylinder(h=5*1.1, r=2, $fn=20);
			}


			translate([-7,0,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([7,0,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([0,-7,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([0,7,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}
		}
	}

	translate([0,0,0]){

		rotate([180,0,0]){

			clip(clipLength,clipRadius);
		}
	}
}






module frontWheelStrut2(widthFoo, buffer, radius){
		
	thickness = 3;
	width = 10;
	
	difference(){

		cube([widthFoo, width, thickness], center=true);

		translate([-(buffer/2) + widthFoo/2,0,-thickness/2]){
			cylinder(h=thickness*1.1, r=radius, $fn=20, center=ture);
		}

		translate([(buffer/2) - widthFoo/2,0,-thickness/2]){
			cylinder(h=thickness*1.1, r=radius, $fn=20, center=ture);
		}

	}

}



module frontWheelStrut1(widthFoo, buffer, radius){
		
	thickness = 3;
	width = 10;
	
	difference(){

		cube([widthFoo, width, thickness], center=true);

		translate([-(buffer/2) + widthFoo/2,0,-thickness/2]){
			cylinder(h=thickness*1.1, r=radius, $fn=20, center=ture);
		}

		translate([(buffer/2) - widthFoo/2,0,-thickness/2]){
			cylinder(h=thickness*1.1, r=radius, $fn=20, center=ture);
		}

	}

}


module frontWheelConnections(length1, length2, buffer, wheelWidth, angle){
	
	thickness = 3;
	width = 10;

	difference(){

		union(){


			translate([-width/2,-width/2, -thickness/2]){
				color("Blue",0.5) cube([length1 + buffer + (width/2) - (wheelWidth/2), width, thickness]);
			} 

			translate([0 ,0,0]){

				rotate([0,0,angle+180]){
			
					translate([-width/2,-width/2,-thickness/2]){

						color("Blue",0.5) cube([length2+(width), width, thickness]);
					}
				}
			}
		}

		translate([0,0,-thickness/2]){
			cylinder(h=thickness*1.1, r=2, $fn=20, center=ture);

			rotate([0,0,angle+180]){

				translate([length2,0,0]){
					cylinder(h=thickness*1.1, r=2, $fn=20, center=ture);
				}
			}
		}
	}

	// NEEDS CLIPS HERE OR ON WHEELS
	translate([length1+buffer-(wheelWidth/2), 0, 0]){

		rotate([0,90,0]){

			clip(wheelWidth*1.1, 5);
		}
	}

}





module frontSteeringStrut(length, width, height){

	difference(){

		cube([width, length , height], center=true);

		translate([0.2 - width/2, 0, -1]){
			cylinder(h=2, r=0.1, $fn=20, center=ture);

		}

		translate([-0.2 + width/2, 0, -1]){
			cylinder(h=2, r=0.1, $fn=20, center=ture);

		}

	}

}

/*
module frontWheelConnections(length1, length2, angle){
	
	// wheel connect
	
		
		difference(){

			union(){

				color("Blue",0.5) cube([length1, 0.5, 0.2], center=true);

				translate([(length1/2) - 0.25, 0 ,-0.1]){
			
					rotate([0,0,-angle]){

						translate([-0.25, -0.25,0]){				

							color("Blue",0.5) cube([length2, 0.5, 0.2]);
						}
					}
				}
			}

			translate([(length1/2) - 0.25, 0 ,-0.1]){
				
				rotate([0,0,-angle]){

						cylinder(h=0.2, r=0.1, $fn=20, center=ture);

						translate([0.2 + length2/2, 0,0]){				

							cylinder(h=0.2, r=0.1, $fn=20, center=ture);
						}
					}
			}

		}
}
*/

module rearAxel(width, height){

	rotate([0,90,0]){
			color("Red",0.5) cylinder(h=height, r=width, $fn=20, center=true);
	}

	//translate([-height/2,0,0]){

		//rotate([0,-90,0]){
		
			//color("blue",0.5) clip(3, 1, 0.1 );
		//}
	//}
}

module wheel(height,width,height){
	
	holeRadius = 5;

	translate([1/2,0,0]){

		rotate([0,90,0]){

			difference(){

				color("Yellow",0.1) cylinder(h=height, r=width, $fn=20, center=true);

				cylinder(h=height*1.1, r=holeRadius, $fn=20, center=true);
			}
		}
	}
}


module wheelBack(height,width,height){
	
	holeRadius = 2;

	translate([1/2,0,0]){

		rotate([0,90,0]){

			difference(){

				color("Yellow",0.1) cylinder(h=height, r=width, $fn=20, center=true);

				cylinder(h=height*1.1, r=holeRadius, $fn=20, center=true);
			}
		}
	}
}

/*
module wheelBack(height,width,height){
	
	translate([1/2,0,0]){

		rotate([0,90,0]){

			difference(){

				color("Yellow",0.5) cylinder(h=height, r=width, $fn=20, center=true);

				//cylinder(h=height*1.1, r=1, $fn=20, center=true);
			}
		}
	}
}
*/

module doubleClip(clipLength,clipRadius){

	clip(clipLength/2,clipRadius);

	rotate([0,180,0]){
		clip(clipLength/2,clipRadius);
	}
}



module clip(clipLength,clipRadius){

	

	difference(){
	
		union() {

			cylinder(clipLength,clipRadius, clipRadius,$fn=100);

			translate([0,0,clipLength-clipLength*0.1]){
				cylinder(clipLength*0.2,clipRadius*1.2, clipRadius,$fn=100);
			}
		}

		translate([0,0,0.1*clipLength]){
			cylinder(clipLength,clipRadius*0.8, clipRadius*0.8,$fn=100);
		}

		translate([-(clipRadius + 1),-1/2,0.3*clipLength]){

			cube([clipRadius*5,1,clipLength]);
		}
	}
}

