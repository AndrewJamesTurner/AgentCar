	
	radius = 5;
	numTeeth = 15;
	toothDepth = 1;

	width = 3.141592 * radius / numTeeth;

	cylinder(h = 2, r=radius, $fn=20, center=true);

	for(i= [0 : numTeeth]){
		
		rotate([0,0,(i/numTeeth)*360]){
			
			translate([radius + toothDepth/2 - 0.1 ,0,0]){
		
				cube([toothDepth,width,2],center=true);
			}
		}
	}
