
dcMotorClip();

// dc motor holder
module dcMotorClip(){
  
  width = 20;
  depth = 20;
  height = 15;
  
  wallThickness = 3;
  
  translate([-depth/2, -(width+(2*wallThickness))/2, 0]){
  
    difference(){
  
      cube([depth, width+(2*wallThickness), height+wallThickness]);
      
      translate([0,wallThickness,0]){  
      
        cube([depth, width,  height]);
      }
    }
  
    for (i = [0,10]){
      for (j = [-10,width+2*wallThickness]){
        
        translate([i, j, 0]){
    
          difference(){

            cube([10,10,3]);
   
            translate([5,5,1.5]){
              cylinder(h=1.5, r=3, $fn=1000);
            }

            translate([5,5,0]){
               cylinder(h=3, r=1, $fn=1000);
            }
          }
        }
      }
    }
  }
}
