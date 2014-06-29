
servoClip();

module servoClip(){
	
  heigth = 12;
  width = 22;
  depth = 21;
  buffer = 5;
  
  translate([-(width+2*buffer)/2,-(depth+buffer)/2,0]){
  
    difference(){
  
      cube([width+2*buffer, depth+buffer, heigth+buffer]); 
  
      translate([buffer,0,0]){
        cube([width, depth, heigth]);
      }
        
        
      translate([0,4,0]){
        cube([buffer,3 , heigth]);
      }  
        
      translate([width+buffer,4,0]){
        cube([buffer,3 , heigth]);
      }   
        
      translate([width+buffer,16,0]){
        cube([buffer,3 , heigth]);
      }   
    }  
    
     translate([width+2*buffer,7,0]){
       
        difference(){
       
        cube([9,9,3]);
        
        translate([4.5,4.5,1.5]){
            cylinder(h=1.5, r=3, $fn=20);
          }

          translate([4.5,4.5,0]){
             cylinder(h=3, r=1.5, $fn=20);
          }
        }
    }
    
    translate([-9,7,0]){
       
        difference(){
       
        cube([9,9,3]);
        
        translate([4.5,4.5,1.5]){
          cylinder(h=1.5, r=3, $fn=20);
        }
          
        translate([4.5,4.5,0]){
          cylinder(h=3, r=1.5, $fn=20);
        }
      }  
    }
  }
}
