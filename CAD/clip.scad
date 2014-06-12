
 

height = 7;
radius = 2;

difference(){
	
	union() {

		cylinder(height,radius, radius,fn=100);

		translate([0,0,height-height*0.1]){
			cylinder(height*0.1,radius*1.2, radius*1.05,$fn=100);
		}
	}

	translate([0,0,0.1*height]){
		cylinder(height,radius*0.8, radius*0.8,$fn=100);
	}

	translate([0,0,0.1*height + 7]){

		cube([6,1,10],center=true);
	}
	
}

