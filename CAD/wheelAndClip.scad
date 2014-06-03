

wheelHeight = 30;
wheelWidth = 5;


wheel(wheelWidth, wheelHeight);

//clip(wheelWidth, 5);

//translate([0,0,0]){
	//rotate([0,90,0]){
		
	//}
//}


module wheel(height,width){
	
	holeRadius = 5;

	//translate([1/2,0]){

		//rotate([0,90]){

			difference(){

				color("Yellow",0.1) circle(r=width, $fn=2000, center=true);

				circle(r=holeRadius*1.05, $fn=2000, center=true);
			}
		//}
	//}
}


module clip(clipLength,clipRadius){

	//translate([0,0,-1.5]){
		cube([12,12,3], center=true);
	//}

	translate([0,0,1.5]){

	difference(){
	
		union() {

			cylinder(clipLength,clipRadius, clipRadius,$fn=1000);

			translate([0,0,clipLength-clipLength*0.1]){
				cylinder(clipLength*0.2,clipRadius*1.2, clipRadius,$fn=1000);
			}
		}

		translate([0,0,0.1*clipLength]){
			cylinder(clipLength,clipRadius*0.7, clipRadius*0.7,$fn=1000);
		}

		translate([-(clipRadius + 1),-1/2,0.0*clipLength]){

			cube([clipRadius*5,1,clipLength*1.2]);
		}
	}

	}

}