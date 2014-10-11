$fn=100;

rubberBandHolder(5,0.5);
//rubberBandHolder(30,2);

module rubberBandHolder(radius,holdRadius){
	
	difference(){
		union() {

			cylinder(h=2, r=radius);
      
      translate([0,0,2]){
        cylinder(h=2, r=radius-2);
      }
      
      translate([0,0,4]){
        cylinder(h=2, r=radius);
      }
    } 
    
    cylinder(h=6, r=holdRadius);
    
  }
}
