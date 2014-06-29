use <stearingClip.scad>
use <carBody.scad>
use <wheel.scad> 
use <dcMotorClip.scad>
use <servoClip.scad>
use <clip.scad>
use <doubleClip.scad>
use <frontWheelClip.scad>
use <frontWheelConnections.scad>
use <backWheelSupport.scad>

$fn=50;

carWidth = 130;
carLength = 200;
carThickness = 8;

wheelHeight = 40;
wheelWidth = 5;

wheelConnect = 20;
wheelConnect2 = 20;

buffer = 40;
buffer2 = 15;
buffer3 = 20;
angle = 70; 


clipHole = 5;

distanceDueToAngle = sin(angle)*wheelConnect2; 
WidthOfSorterStrut = -buffer2+carWidth-(2*cos(angle)*wheelConnect2); 

// main baody of car
translate([0,0,-carThickness/2]){
  carBody(carWidth,carLength,carThickness);
}

for (i = [0, 1]){

	mirror([ i, 0, 0 ]){ 

		// front wheels 
		translate([(wheelConnect) + (carWidth/2), -buffer+(carLength/2), -carThickness-3]){
			color("Green")  wheel(wheelHeight,wheelWidth,5); 
		}	

		// rear wheels
		translate([(wheelConnect) + (carWidth/2) , buffer3-(carLength/2), -carThickness-3]){
			color("Green") wheel(wheelHeight,wheelWidth,2);
		}
	
    // front wheel connection
		translate([(carWidth/2)-buffer2, -buffer+(carLength/2), -carThickness-3]){
			frontWheelConnections(wheelConnect+buffer2, wheelConnect2, wheelWidth, angle);
		}

		// front wheel clips
    
      translate([(carWidth/2)-buffer2, -buffer+(carLength/2),-carThickness/2]){
        rotate([0,180,0]){
        frontWheelClip(7,4);
      }
		}

		translate([(carWidth/2)-buffer2,buffer3-carLength/2,-carThickness/2]){
      rotate([0,180,0]){
        backWheelSupport();
      }
    }

    //
		translate([(WidthOfSorterStrut/2)-buffer2/2, -buffer+(carLength/2)-distanceDueToAngle,-carThickness-4.5]){
			doubleClip(7,4);
		}
		
    
    translate([carWidth*0.3, +(carLength)*0.37, 1.5*carThickness]){
      rotate([0,0,-45]){
        ultrasound();
      }
    }

	}	

	// rear axel
	translate([0,buffer3-carLength/2,-5.5-carThickness/2]){
		rearAxel(2, (carWidth) + (wheelConnect*2));
	}


	//
	translate([0,-buffer+carLength/2,-carThickness-6]){
		color("Blue") frontWheelStrut1(-buffer2+carWidth, buffer2, 4);
	}


	translate([0,-buffer+(carLength/2)-distanceDueToAngle,-carThickness-6])		{
		color("Blue") frontWheelStrut1(WidthOfSorterStrut, buffer2, 4);
	}	


	translate([0, 20, -carThickness]){
			rotate([180,0,0]){
				color("RED") servoClip();
			}
	}
  
  translate([0, -(carLength)/4, carThickness]){
    rotate([180,0,90]){
      arduino();
    }
  }
  
  translate([0, +(carLength)*0.45, 1.5*carThickness]){
    ultrasound();
  }

  translate([(carWidth/2) - 10, 0, -carThickness/2]){
			rotate([0,180,0]){
				color("RED") dcMotorClip();
			}
	}

  translate([0,-buffer+(carLength/2)-distanceDueToAngle,-carThickness-8])		{
    rotate([0,180,0]){
      stearingClip();
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

module rearAxel(width, height){

	rotate([0,90,0]){
			color("Red",0.5) cylinder(h=height, r=width, $fn=20, center=true);
	}
}





