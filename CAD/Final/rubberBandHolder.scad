

rubberBandHolder(5,1);

module rubberBandHolder(radius,holdRadius){
	
	difference(){
		union() {

			cylinder(h=2, r=radius, $fn=100);
      
      translate([0,0,2]){
        cylinder(h=2, r=radius-2, $fn=100);
      }
      
      translate([0,0,4]){
        cylinder(h=2, r=radius, $fn=100);
      }
    } 
    
    cylinder(h=6, r=holdRadius, $fn=100);
    
  }
}
