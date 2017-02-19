module lm2596DcDcBody(){
    //pcb max dimensions, not the contour
    color([0,0,0.5])
        cube([43.5, 22.5, 1.6]);
    //socket headers for ardiuno
    /*color([0,0,0]){
        translate([0.5, 0.5,1]){
            cube([2.54*8, 2.54, 2.54]);
        }
    }*/
}

module lm2596DcDcHolePattern(r,h){
    rr = 3/2;
    translate([5.5+rr, 17+rr, 0]){
        cylinder(h, r, r);
    }

    translate([35.5+rr, 1+rr, 0]){
        cylinder(h, r, r);
    }
    
}

module lm2596DcDcModule(){
    difference(){
        lm2596DcDcBody();
        translate([0, 0, -1])
            lm2596DcDcHolePattern(3/2, 3);
    }
}

module lm2596DcDcFixture(r, th){
    difference(){
        union(){
            translate([0, 0, -th-2])
                cube([43.5, 22.5, th]);
            translate([4, 0, -2])
                cube([43.5-8, 22.5, 2]);
        }
        
            translate([0, 0, 0-th-3])
                lm2596DcDcHolePattern(r, th+4);
        
        
        }
}

//lm2596DcDcBody();
lm2596DcDcModule();
lm2596DcDcFixture(3/2, 5);
