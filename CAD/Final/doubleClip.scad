

$fn=100;
doubleClip(12.5,3.95);

module doubleClip(clipLength,clipRadius){

	cylinder(h=4, r=5.5);

	cylinder(h=clipLength, r=clipRadius);

//	clip(clipLength/2,clipRadius);

	rotate([0,180,0]){
//		clip(clipLength/2,clipRadius);
	}
}


/*
	xxxx
	xxxx
10	x||x
9	x||x
8	 ||
7	 ||
6    ||
5    ||
4	||||
3	||||
2	||||
1	||||
*/
