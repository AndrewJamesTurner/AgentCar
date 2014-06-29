

wheelHeight = 40;
wheelWidth = 5;
holeRadius = 5;

wheel2D(wheelHeight, wheelWidth,holeRadius); 

module wheel(height,width,holeRadius){
	


	translate([-width,0,0]){  

		rotate([0,90,0]){

			difference(){

				cylinder(h=width, r=height, $fn=1000);

				cylinder(h=width, r=holeRadius, $fn=1000);
			}
		}
	}
}


module wheel2D(height,width,holeRadius){
	
  rotate([0,90,0]){

    difference(){

      circle(h=width, r=height, $fn=1000);

      circle(h=width, r=holeRadius, $fn=1000);
    }
  }
}
