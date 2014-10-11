$fn=100;

// fount wheels
//Cap(4,4.9,7);

// double clip
Cap(4,3.9,5.5);

module Cap(height, innerRadius, outerRadius){

	thickness = 3;

	rotate([0,90,0]){

		difference(){
			cylinder(h=height, r=outerRadius);
			cylinder(h=height-2, r=innerRadius);
		}
	}
}
