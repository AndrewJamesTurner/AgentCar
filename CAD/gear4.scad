	

	radius = 5;
	numTeeth = 10;
	toothDepth = 1.5;
	height = 2;
	gearAngle = 0.6;

	depth = 3.141592 * radius / numTeeth;

	cylinder(h = height, r=radius, $fn=20, center=true);

	for(i= [0 : numTeeth]){
		
		rotate([0,0,(i/numTeeth)*360]){
			
			translate([radius - 0.1 ,0,0]){
		
				rotate([0,90,0]){
					gear(height, toothDepth, depth, gearAngle);
				}
			}
		}
	}

	

	module gear(width, depth, height, ratio){

		halfWidth = width / 2;
		haldDepth = depth / 2;
		//halfHeight = height / 2;
		

	/*
		0 = [-halfWidth, -haldDepth, 0];
		1 = [halfWidth, -haldDepth, 0];
		2 = [halfWidth, haldDepth, 0];
		3 = [-halfWidth, haldDepth, 0];

		4 = [-halfWidth*ratio, -haldDepth, height];
		5 = [halfWidth*ratio, -haldDepth, height];
		6 = [halfWidth*ratio, haldDepth, height];
		7 = [-halfWidth*ratio, haldDepth, height];
	*/
		


		polyhedron( 

			points = [[-halfWidth, -haldDepth, 0],[halfWidth, -haldDepth, 0],[halfWidth, haldDepth, 0],[-halfWidth, haldDepth, 0],[-halfWidth, -haldDepth*ratio, height],[halfWidth, -haldDepth*ratio, height],[halfWidth, haldDepth*ratio, height], [-halfWidth, haldDepth*ratio, height]], 

		triangles = [ 

			[0,1,3], [1,2,3], 		//bottom
	
			[0,1,4], [1,4,5] ,		// frount side

			[1,2,5], [2,5,6], 		// right side

			[2,3,6], [3,6,7], 		// back side

			[0,3,4], [3,4,7],		// left side

			[4,5,7], [5,6,7]		// top

		
		]

		);




	}
	
