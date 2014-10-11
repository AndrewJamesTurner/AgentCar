$fn=100;

stearingClip();


module stearingClip(){
	
  width = 3;
  depth = 5;
  height = 8;
  
  buffer = 2;
  
  r = width/2;
  
  translate([-(width+2*buffer)/2,-(depth)/2,0]){
    
    difference(){
      cube([width+2*buffer, depth, height+buffer]);
      
      translate([buffer,0,0]){    
      
        union(){
          cube([width, depth, height-r]);
          
          translate([r,depth,height-r]){    
          
            rotate([90,0,00]){
              cylinder(h=depth*1.1, r=r);
            }
          }
        }
      }
    }
    
    
    translate([-5,0,0]){
    
      difference(){
         
      cube([5,5,2]);
      
      translate([2.5,2.5,1]){
          cylinder(h=1, r=1.5);
        }
        
        translate([2.5,2.5,0]){
           cylinder(h=2, r=1);
        }
      }  
    }
    
    translate([5+buffer,0,0]){
    
      difference(){
         
      cube([5,5,2]);
      
      translate([2.5,2.5,1]){
          cylinder(h=1, r=1.5);
        }
        
        translate([2.5,2.5,0]){
           cylinder(h=2, r=1);
        }
      }  
    }  
  
  }
  
}















