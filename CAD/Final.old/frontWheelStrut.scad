$fn=100;


carWidth = 130;
carLength = 200;
carThickness = 8;

wheelHeight = 40;
wheelWidth = 5;

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


frontWheelStrut2D(WidthOfLongerStrut, frontClipFromSide, 4);
//frontWheelStrut2D(WidthOfSorterStrut, frontClipFromSide, 4);




module frontWheelStrut(widthFoo, frontToFrontWheels, radius){
		
	thickness = 3;
	width = 10;
	
	difference(){

		cube([widthFoo, width, thickness], center=true);

		translate([-(frontToFrontWheels/2) + widthFoo/2,0,-thickness/2]){
			cylinder(h=thickness*1.1, r=radius, center=ture);
		}

		translate([(frontToFrontWheels/2) - widthFoo/2,0,-thickness/2]){
			cylinder(h=thickness*1.1, r=radius, center=ture);
		}
	}
}

module frontWheelStrut2D(widthFoo, frontToFrontWheels, radius){
		
	thickness = 3;
	width = 10;
	
	difference(){

		square([widthFoo, width], center=true);

		translate([-(frontToFrontWheels/2) + widthFoo/2,0]){
			circle(r=radius, center=ture);
		}

		translate([(frontToFrontWheels/2) - widthFoo/2,0,0]){
			circle(r=radius, center=ture);
		}
	}
}


