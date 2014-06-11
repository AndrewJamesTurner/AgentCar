// servo holder

servoHeight = 31;
servoWidth = 22;
servoDepth = 12;

clipHeightPos = 11;


clipHeight = 2;
clipWidth = 5;
clipDepth = 2;

wireHeight = 31 - 4;

thickness = 7;
thicknessLess = 4;
thicknessTop = 4;

screwShaft = 2;
screwHead = 5;

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