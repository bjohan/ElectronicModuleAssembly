module mosModule140c07Body(){
 translate([1,1,0]){
    color([0.5, 0, 0])
        cube([34, 26, 1]);
   
    
    color([0, 0, 0.5])
        translate([5.5,4.5,1])
            cube([10, 8, 10]);
    
    color([0, 0, 0.5])
        translate([18,4.5,1])
            cube([10, 8, 10]);
    color([0, 0, 0])
        translate([7,22,1])
            cube([7.68, 2.54, 2.54]);
    
    color([0, 0, 0])
        translate([17,18,1])
            cube([10, 4.5, 13]);
    color([0.5, 0.5, 0.5])
        translate([17,18,14])
            cube([10, 1.2, 7]);
        }
}

module mosModule140c07HolePattern(r,h){
    translate([1,1,0]){
    translate([1+1.6,11+1.6, 0])
        cylinder(h, r, r);
    translate([29.8+1.6,11+1.6, 0])
        cylinder(h, r, r);
    }
}

module mosModule140c07Module(){
    difference(){
        mosModule140c07Body();
        translate([0,0,-1])
            mosModule140c07HolePattern(1.5,3);
    }
}

module mosModule140c07Fixture(r, th){
    difference(){
        translate([0,0,-3]){
            mosModule140c07HolePattern(2.8,3);
            translate([0,0,3-th])
            cube([36, 28, th-3]);
        }
        translate([0,0,0-th-1])
            mosModule140c07HolePattern(r,th+2);
                
    }
}

//mosModule140c07Body();
//mosModule140c07HolePattern(1.5,10);
//mosModule140c07Module();
//mosModule140c07Fixture(3/2, 5);
