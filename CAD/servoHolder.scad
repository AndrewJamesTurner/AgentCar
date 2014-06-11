// servo holder

servoHeight = 50;
servoWidth = 30;
servoDepth = 10;

clipHeightPos = 30;


clipHeight = 4;
clipWidth = 3;
clipDepth = 2;


thickness = 4;

screwShaft = 2;
screwHead = 4;

difference(){

	

	cube([servoWidth+(2*thickness), servoDepth+thickness, servoHeight+thickness], center=true);
	

	translate([0,-thickness/2,-thickness/2]){
		cube([servoWidth, servoDepth, servoHeight], center=true);
	}
	
	for (i = [0, 1]){
		mirror([ i, 0, 0 ]){		
			translate([-(servoWidth+clipWidth)/2,-(thickness)/2, -((servoHeight+thickness)/2) + clipHeightPos + clipHeight/2]){
				cube([clipWidth, servoDepth, clipHeight], center=true);
			}
		}
	}



}

for (i = [0, 1]){

	mirror([ i, 0, 0 ]){


		translate([5 +thickness + servoWidth/2,0,2.5-(servoHeight+thickness)/2]){
	
			difference(){
				cube([10,servoDepth+thickness,5], center=true);


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