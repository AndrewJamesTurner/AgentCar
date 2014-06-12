carWidth = 130;
carLength = 220;
carThickness = 8;

wheelHeight = 50;
wheelWidth = 5;

wheelConnect = 20;
wheelConnect2 = 20;

buffer = 50;
buffer2 = 15;
buffer3 = 50;
angle = 70;

radius = 10;
clipHole = 5;

distanceDueToAngle = sin(angle)*wheelConnect2; 
WidthOfSorterStrut = -buffer2+carWidth-(2*cos(angle)*wheelConnect2); 

// main baody of car
translate([0,0,-carThickness/2]){
  minkowski()
  {
    
    color("Orange",0.2) cube([carWidth-radius, carLength-radius, carThickness/2], center=true);
    cylinder(r=radius/2,h=carThickness/2);
  }
}

for (i = [0, 1]){

	mirror([ i, 0, 0 ]){ 

		// front wheels
		translate([(wheelConnect) + (carWidth/2), -buffer+(carLength/2), -carThickness-3]){
			wheel(wheelWidth, wheelHeight);
		}	

		// rear wheels
		translate([(wheelConnect) + (carWidth/2) , buffer3-(carLength/2), -carThickness-3]){
			wheelBack(wheelWidth, wheelHeight);
		}
	
    // front wheel connection
		translate([(carWidth/2)-buffer2, -buffer+(carLength/2), -carThickness-3]){
			frontWheelConnections(wheelConnect, wheelConnect2, buffer2, wheelWidth, angle);
		}

		// front wheel clips
		translate([(carWidth/2)-buffer2, -buffer+(carLength/2),-carThickness]){
			frontWheelClip(7);
		}

		translate([(carWidth/2)-buffer2,buffer3-carLength/2,-carThickness]){
			backWheelSupport();
		}

    //
		translate([(WidthOfSorterStrut/2)-buffer2/2, -buffer+(carLength/2)-distanceDueToAngle,-carThickness-3]){
			doubleClip(7,4);
		}
		
    
    translate([carWidth*0.35, +(carLength)*0.35, 1.5*carThickness]){
      rotate([0,0,-45]){
        ultrasound();
      }
    }

	}	

	// rear axel
	translate([0,buffer3-carLength/2,-carThickness-3]){
		rearAxel(2, (carWidth) + (wheelConnect*2) + wheelWidth);
	}


	//
	translate([0,-buffer+carLength/2,-carThickness-6]){
		frontWheelStrut1(-buffer2+carWidth, buffer2, 4);
	}


	translate([0,-buffer+(carLength/2)-distanceDueToAngle,-carThickness-6])		{
		frontWheelStrut1(WidthOfSorterStrut, buffer2, 4);
	}	


	translate([0, (carLength)/2, -carThickness]){
			rotate([180,0,180]){
				servoClip();
			}
	}
  
  translate([0, -(carLength)/4, carThickness]){
    arduino();
  }
  
  translate([0, +(carLength)*0.45, 1.5*carThickness]){
    ultrasound();
  }

  translate([carWidth/2, 0, -carThickness]){
			rotate([0,0,0]){
				dcMotorClip();
			}
	}


}


// dc motor holder
module dcMotorClip(){
  
 
  width = 20;
  depth = 20;
  height = 15;
  
  wallThickness = 3;
  
  translate([-depth/2, 0, -height/2]){
  
    difference(){
  
      cube([depth, width+(2*wallThickness), height+wallThickness], center=true);
      
      translate([0,0,wallThickness/2]){  
      
        cube([depth, width,  height], center=true);
     
      }
      
    }
  }
  
  
  for (i = [-5,+5-depth]){
    for (j = [width-5+wallThickness,-width+5-wallThickness]){
  
  
      translate([i, j, 0]){
  
        difference(){
  
   
          cube([10,10,3], center=true);
      
      
			
          translate([0,0,-1.5]){
            cylinder(h=1.5, r=3, $fn=20);
          }


          translate([0,0,0]){
             cylinder(h=3, r=1, $fn=20);
          }
 
      }
    
    }
  
  
  }
}
}

// arduino board
module arduino(){
  color("Blue",1) cube([68.6,53.3,10], center=true);
}

// ultrasound module
module ultrasound(){
  color("Blue",1) cube([45,2,20], center=true);
  
  translate([(45/2)-10,13/2,0]){
    rotate([90,0,0])
      color("Blue",1) cylinder(h=13, r=7.5, $fn=1000, center=true);
  }
  
  translate([-(45/2)+10,13/2,0]){
    rotate([90,0,0])
      color("Blue",1) cylinder(h=13, r=7.5, $fn=1000, center=true);
  }
  
}


module backWheelSupport(){

	difference(){
		
		translate([0,0,-4]){
			
			cube([5,5,5], center=true);
		}

		translate([0,0,-4]){
		
			rotate([0,90,0]){
				cylinder(h=10, r=2.1, $fn=1000, center=true);
			}
		}

	}


	difference(){

		union(){

			cube([10,30,3], center=true);
			cube([30,10,3], center=true);
		}

		rotate([180,0,0]){
		
			translate([-10,0,0]){
				cylinder(h=5*1.1, r=3, $fn=20);
			}

			translate([10,0,0]){
				cylinder(h=5*1.1, r=3, $fn=20);
			}

			translate([0,-10,0]){
				cylinder(h=5*1.1, r=3, $fn=20);
			}

			translate([0,10,0]){
				cylinder(h=5*1.1, r=3, $fn=20);
			}


			translate([-10,0,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([10,0,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([0,-10,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([0,10,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}
		}
	}
}


module frontWheelClip(height){

	clipLength = height;
	clipRadius = 4;
	
	difference(){

		union(){

			cube([10,30,3], center=true);
			cube([30,10,3], center=true);
		}

		rotate([180,0,0]){
		
			translate([-10,0,0]){
				cylinder(h=5*1.1, r=3, $fn=20);
			}

			translate([10,0,0]){
				cylinder(h=5*1.1, r=3, $fn=20);
			}

			translate([0,-10,0]){
				cylinder(h=5*1.1, r=3, $fn=20);
			}

			translate([0,10,0]){
				cylinder(h=5*1.1, r=3, $fn=20);
			}


			translate([-10,0,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([10,0,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([0,-10,-1.5]){
				cylinder(h=5*1.1, r=1, $fn=20);
			}

			translate([0,10,-1.5]){
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
				color("Blue",0.5) cube([length1 + buffer , width, thickness]);
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
			cylinder(h=thickness*1.1, r=4, $fn=20, center=ture);

			rotate([0,0,angle+180]){

				translate([length2,0,0]){
					cylinder(h=thickness*1.1, r=4, $fn=20, center=ture);
				}
			}
		}
	}

	
	

    translate([length1+ buffer   - 2.5,0,0]){
      //color("Red",0.5) cube([5,20,20], center=true);
    }
		
    translate([length1 - (wheelWidth*1.1) + buffer-2.4, 0, 0]){
      rotate([0,90,0]){
        color("Red",0.5) cylinder(h=5, r=10, center=true);
      }
    }
    
    rotate([0,90,0]){
      translate([0,0,length1 - (wheelWidth*1.1) + buffer-(wheelWidth*1.1)/4]){
        clip(wheelWidth*1.1, 5);
      }
	}

}




/*
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
*/
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

				color("Yellow",0.1) cylinder(h=height, r=width, $fn=1000, center=true);

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

				color("Yellow",0.1) cylinder(h=height, r=width, $fn=1000, center=true);

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

  translate([0,0,-clipLength/2]){

	clip(clipLength/2,clipRadius);
}
	rotate([0,180,0]){
		clip(clipLength/2,clipRadius);
	}

}


module clip(clipLength,clipRadius){

	
	translate([0,0,1.5]){

	difference(){
	
		union() {

			cylinder(clipLength,clipRadius, clipRadius,$fn=1000);

			translate([0,0,clipLength-clipLength*0.1]){
				cylinder(1,clipRadius *1.1, clipRadius,$fn=1000);
			}
		}

		translate([0,0,0.1*clipLength]){
			cylinder(clipLength*2,clipRadius*0.7, clipRadius*0.7,$fn=1000);
		}

		translate([-(clipRadius ),-1/2,0.2*clipLength]){
			cube([clipRadius*2,2,clipLength*2]);
		}
	}

	}

}


module servoClip(){
	
	servoHeight = 31;
	servoWidth = 22;
	servoDepth = 12;

	clipHeightPos = 11;


	clipHeight = 2;
	clipWidth = 5;
	clipDepth = 2;

	wireHeight = 31 - 4;

	thickness = 6;
	thicknessLess = 4;
	thicknessTop = 4;

	screwShaft = 2;
	screwHead = 5;

	translate([0,thicknessLess-(servoWidth/2),(servoHeight+(thicknessTop/2))/2]){

		difference(){

			cube([servoWidth+(2*thickness), servoDepth+thicknessLess, servoHeight+thicknessTop], center=true);
	

			translate([0,-thicknessLess/2,-thicknessTop/2]){
				cube([servoWidth, servoDepth, servoHeight], center=true);
			}
	
			for (i = [0, 1]){
				mirror([ i, 0, 0 ]){		
					translate([-(servoWidth+clipWidth)/2,-(thicknessLess)/2, -((servoHeight+thicknessTop)/2) + clipHeightPos - clipHeight/2]){
						cube([clipWidth, servoDepth, clipHeight], center=true);
					}
				}
			}

			translate([-(servoWidth+clipWidth)/2,-(thicknessLess)/2, -((servoHeight+thicknessTop)/2) + wireHeight - clipHeight/2]){
					cube([clipWidth*2, servoDepth, clipHeight], center=true);
			}
		}

		for (i = [0, 1]){

			mirror([ i, 0, 0 ]){

				translate([5 +thickness + servoWidth/2,0,2.5-(servoHeight+thicknessTop)/2]){
	
					difference(){
					
						cube([10,servoDepth+thicknessLess,5], center=true);

						translate([0,0,+5/2]){
							cylinder(h=5, r=screwHead/2, $fn=20, center=true);
						}

						translate([0,0,-5/2]){
							cylinder(h=5, r=screwShaft/2, $fn=20, center=true);
						}
					}
		
				}
			}
		}
	}
}


/*
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
*/
