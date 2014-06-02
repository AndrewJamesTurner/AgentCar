

difference() {

	cube([50,4,2], center=true);

	for (x = [-22,22]){
		translate([x,0,-2]){
			cylinder(h=4,r=1.5, $fn=100);
		}
	}
}