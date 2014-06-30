$fn=100;

wheelHeight = 40;
wheelWidth = 5;

//wheel2D(wheelHeight, wheelWidth,5); 
wheel2D(wheelHeight, wheelWidth,2); 

module wheel(height,width,holeRadius){
	


	translate([-width,0,0]){  

		rotate([0,90,0]){

			difference(){

				cylinder(h=width, r=height);

				cylinder(h=width, r=holeRadius);
			}
		}
	}
}


module wheel2D(height,width,holeRadius){
	
  

    difference(){

      circle(r=height);

      circle(r=holeRadius);
    }
  
}
