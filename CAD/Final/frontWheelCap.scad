$fn=100;

module Cap(height, innerRadius, outerRadius){

	thickness = 3;

	rotate([0,90,0]){

		difference(){

			cylinder(h=height, r=outerRadius, center=ture);

			cylinder(h=height-2, r=innerRadius, center=ture);
		}

	}
}
