use <clip.scad>

doubleClip(20,5);

module doubleClip(clipLength,clipRadius){

	clip(clipLength/2,clipRadius);

	rotate([0,180,0]){
		clip(clipLength/2,clipRadius);
	}
}
