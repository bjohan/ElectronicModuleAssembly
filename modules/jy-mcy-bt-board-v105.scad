module jyMcuBtBoardV105Body(){
    translate([6,0,0]){
        //pcb max dimensions, not the contour
        color([0,0,0.5])
            cube([16.5, 37, 1]);
        //socket headers for ardiuno
        color([0,0.5,0]){
            translate([1, 8,1]){
                cube([14, 29, 3]);
            }
        }
        
        color([0,0,0]){
            translate([3.25, 0,1]){
                cube([10, 2.54, 3]);
            }
        }
    }
}

module jyMcuBtBoardV105HolePattern(r,h){
    translate([6-r,15, 0])
        cylinder(h, r, r);
    translate([6+16.5+r,15, 0])
        cylinder(h, r, r);
}

module jyMcuBtBoardV105Module(){
    jyMcuBtBoardV105Body();
}

module jyMcuBtBoardV105Fixture(r, th){
    difference(){
        translate([0,0,-th]){
            cube([16.5+12, 37, th]);
        }
        translate([0,0,0-th-1])
                jyMcuBtBoardV105HolePattern(1.5,th+2);
    }
}
//jyMcuBtBoardV105Body();
//jyMcuBtBoardV105HolePattern(1.5,10);
//jyMcuBtBoardV105Module();
//jyMcuBtBoardV105Fixture(3/2, 5);
