module dkNano003Body(){
    //pcb max dimensions, not the contour
    color([0,0,0.5])
        cube([53, 59, 1]);
    //socket headers for ardiuno
    color([0,0,0]){
        translate([17.6, 2.54,1]){
            cube([2.54, 39, 8.5]);
            translate([2.54+12.6, 0, 0])
                cube([2.54, 39, 8.5]);
        }
    }
}

module dkNano003HolePattern(r,h){
    rr = 3.4/2;
    translate([0.9+rr, 2.5+rr, 0]){
        cylinder(h, r, r);
    }
    
    translate([49+rr, 1.1+rr, 0]){
        cylinder(h, r, r);
    }
    
    translate([16+rr, 53.3+rr, 0]){
        cylinder(h, r, r);
    }
    
    translate([43.8+rr, 53.3+rr, 0]){
        cylinder(h, r, r);
    }
}

module dkNano003Module(){
    difference(){
        dkNano003Body();
        translate([0, 0, -1])
            dkNano003HolePattern(3.4/2, 3);
    }
}

module dkNano003Fixture(r, th){
    difference(){
        intersection(){
            translate([0,0,-3]){
                dkNano003HolePattern(6/2, 3);
                translate([0,0,3-th])
                    cube([53, 59, th-3]);
            }
            translate([0, 0, 0-3-th])
                cube([53, 59, th+3+0.5]);
        }
        
        translate([0, 0, 0-3-th-1])
            dkNano003HolePattern(r, 3+th+2);
        }
}
dkNano003Module();
dkNano003Fixture(3/2, 5);
