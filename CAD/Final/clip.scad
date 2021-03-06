$fn=100;

clip(20,5);

module clip(clipLength,clipRadius){
	
	difference(){
		union() {

			cylinder(clipLength,clipRadius, clipRadius);

			translate([0,0,clipLength-1]){
				cylinder(1,clipRadius +1, clipRadius);
			}
		}

		translate([0,0,0.1*clipLength]){
			cylinder(clipLength*2,clipRadius*0.7, clipRadius*0.7);
		}

		translate([-(clipRadius*1.5 ),-1/2,0.2*clipLength]){
			cube([clipRadius*3,2,clipLength*2]);
		}
	}
}
