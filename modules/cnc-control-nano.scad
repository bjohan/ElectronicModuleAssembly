module cncControlNanoBody(){
    //pcb max dimensions, not the contour
    color([0.85,0,0.0])
        cube([59.5, 72, 1.6]);
    //socket headers for ardiuno
    color([0,0,0]){
        translate([26.5, 8,1]){
            cube([2.54, 39, 8.5]);
            translate([2.54+12.6, 0, 0])
                cube([2.54, 39, 8.5]);
        }
    }
}

module cncControlNanoHolePattern(r,h){
    rr = 3.4/2;
    translate([0.9+rr, 1.5+rr, 0]){
        cylinder(h, r, r);
    }
    
    translate([23.5+rr, 1.5+rr, 0]){
        cylinder(h, r, r);
    }
    
    translate([54+rr, 1.5+rr, 0]){
        cylinder(h, r, r);
    }
    
    translate([0.9+rr, 67+rr, 0]){
        cylinder(h, r, r);
    }
    
    translate([54+rr, 51+rr, 0]){
        cylinder(h, r, r);
    }
}

module cncControlNanoModule(){
    difference(){
        cncControlNanoBody();
        translate([0, 0, -1])
            cncControlNanoHolePattern(3.4/2, 3);
    }
}

module cncControlNanoFixture(r, th){
    difference(){
        intersection(){
            translate([0,0,-3]){
                cncControlNanoHolePattern(6/2, 3);
                translate([0,0,3-th])
                    cube([59.5, 72, th-3]);
            }
            translate([0, 0, 0-3-th])
                cube([59.5, 72, th+3+0.5]);
        }
        
        translate([0, 0, 0-3-th-1])
            cncControlNanoHolePattern(r, 3+th+2);
        }
}
cncControlNanoModule();
cncControlNanoFixture(3/2, 5);
