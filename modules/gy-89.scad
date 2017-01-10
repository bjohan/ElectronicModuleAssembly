module gy89Body(){
    //pcb max dimensions, not the contour
    color([0,0,0.5])
        cube([21.5, 17.4, 1.6]);
    //socket headers for ardiuno
    color([0,0,0]){
        translate([0.5, 0.5,1]){
            cube([2.54*8, 2.54, 2.54]);
        }
    }
}

module gy89HolePattern(r,h){
    rr = 3/2;
    translate([1.2+rr, 12.8+rr, 0]){
        cylinder(h, r, r);
    }
    
}

module gy89Module(){
    difference(){
        gy89Body();
        translate([0, 0, -1])
            gy89HolePattern(3/2, 3);
    }
}

module gy89Fixture(r, th){
    difference(){
            translate([0, 0, -th])
                cube([21.5, 17.4, th]);
            translate([-1, -1, -2.54])
                cube([21.5+2, 2.54+2, 2.54+1]);
            translate([0, 0, 0-th-1])
                gy89HolePattern(r, th+2);
        
        
        }
}

//gy89Body();
gy89Module();
gy89Fixture(3/2, 5);
