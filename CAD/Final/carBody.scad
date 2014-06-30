
$fn=100;

carWidth = 130;
carLength = 200;
carThickness = 8;

carBody2D(carWidth, carLength, carThickness );

module carBody(carWidth, carLength, carThickness ){

  radius = 10;

  difference(){
    translate([-(carWidth-radius)/2,-(carLength-radius)/2,0]){
      minkowski()
      {
        color("Orange",0.2) cube([carWidth-radius, carLength-radius, carThickness/2]);
        cylinder(r=radius/2,h=carThickness/2);
      }
    }
    
    cylinder(h=carThickness*1.5, r=5);
  
  }
}


module carBody2D(carWidth, carLength, carThickness ){

  radius = 10;

  difference(){
    translate([-(carWidth-radius)/2,-(carLength-radius)/2,0]){
      minkowski()
      {
        color("Orange",0.2) square([carWidth-radius, carLength-radius]);
        circle(r=radius/2);
      }
    }
    
    circle(r=5);
  
  }
}
