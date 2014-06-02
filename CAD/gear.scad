
numGaps = 10;

difference(){
	

	cylinder(h = 2, r=5, $fn=20, center=true);

	for(i= [0 : numGaps]){
		echo((i/numGaps)*360);

		
			rotate([0,0,(i/numGaps)*360]){
			
			translate([5.5,0,0]){
		
				cylinder(h = 2, r=2, $fn=20, center=true);
			}
		}
	}
}