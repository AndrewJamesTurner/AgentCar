use <clip.scad>

$fn=100;
doubleClip(7,4);

module doubleClip(clipLength,clipRadius){

	clip(clipLength/2,clipRadius);

	rotate([0,180,0]){
		clip(clipLength/2,clipRadius);
	}
}
