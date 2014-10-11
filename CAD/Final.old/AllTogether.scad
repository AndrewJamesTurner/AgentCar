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
use <rubberBandHolder.scad>
use <frontWheelStrut.scad>

$fn=50;

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


clipHole = 5;

distanceDueToAngle = sin(angle)*wheelConnect2; 
WidthOfSorterStrut = -frontClipFromSide+carWidth-(2*cos(angle)*wheelConnect2); 
WidthOfLongerStrut = -frontClipFromSide+carWidth;

echo("WidthOfSorterStrut");
echo(WidthOfSorterStrut);

echo("WidthOfLongerStrut");
echo(WidthOfLongerStrut);

echo("angle");
echo(angle);


// main baody of car
translate([0,0,-carThickness/2]){
  carBody(carWidth,carLength,carThickness);
}

for (i = [0, 1]){

	mirror([ i, 0, 0 ]){ 

		// front wheels 
		translate([(wheelConnect) + (carWidth/2), -frontToFrontWheels+(carLength/2), -carThickness-3]){
			color("Green")  wheel(wheelHeight,wheelWidth,5); 
		}	

		// rear wheels
		translate([(wheelConnect) + (carWidth/2) , backToBackWheels-(carLength/2), -carThickness-3]){
			color("Green") wheel(wheelHeight,wheelWidth,2);
		}
	
    // front wheel connection
		translate([(carWidth/2)-frontClipFromSide, -frontToFrontWheels+(carLength/2), -carThickness-3]){
			frontWheelConnections(wheelConnect+frontClipFromSide, wheelConnect2, wheelWidth, angle);
		}

		// front wheel clips
    
      translate([(carWidth/2)-frontClipFromSide, -frontToFrontWheels+(carLength/2),-carThickness/2]){
        rotate([0,180,0]){
          frontWheelClip(7,4);
      }
		}

		translate([(carWidth/2)-frontClipFromSide,backToBackWheels-carLength/2,-carThickness/2]){
      rotate([0,180,0]){
        backWheelSupport();
      }
    }

    //
		translate([(WidthOfSorterStrut/2)-frontClipFromSide/2, -frontToFrontWheels+(carLength/2)-distanceDueToAngle,-carThickness-4.5]){
			doubleClip(7,4);
		}
		
    
    translate([carWidth*0.3, +(carLength)*0.37, 1.5*carThickness]){
      rotate([0,0,-45]){
        ultrasound();
      }
    }
	}	

	// rear axel
	translate([0,backToBackWheels-carLength/2,-5.5-carThickness/2]){
		rearAxel(2, (carWidth) + (wheelConnect*2));
	}


	//
	translate([0,-frontToFrontWheels+carLength/2,-carThickness-6]){
		color("Blue") frontWheelStrut(WidthOfLongerStrut, frontClipFromSide, 4);
	}


	translate([0,-frontToFrontWheels+(carLength/2)-distanceDueToAngle,-carThickness-6])		{
		color("Blue") frontWheelStrut(WidthOfSorterStrut, frontClipFromSide, 4);
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
  
  translate([(carWidth/2) + 5, 0, -10-carThickness/2]){
			rotate([0,90,0]){
				rubberBandHolder(5,1);
			}
	}
  
  translate([(carWidth/2) + 5, -backToBackWheels-40, -6-carThickness/2]){
			rotate([0,90,0]){
				rubberBandHolder(30,2);
			}
	}
  

  translate([0,-frontToFrontWheels+(carLength/2)-distanceDueToAngle,-carThickness-8])		{
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






module rearAxel(width, height){

	rotate([0,90,0]){
			color("Red",0.5) cylinder(h=height, r=width, $fn=20, center=true);
	}
}





