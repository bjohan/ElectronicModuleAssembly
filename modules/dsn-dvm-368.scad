module dsnDvm368Body(){
    color([0, 0.5, 0]){
        translate([0, 4.7,0])
            cube([32.8, 5, 1]);
        
        translate([5.2,0,0])
            cube([22.6, 14.3, 1]);
        
    }
    
    color([1, 1, 1])
        translate([5.2,0,1])
            cube([22.6, 14.3, 7]);
    
    color([0.2, 0.2, 0.2])
        translate([5.2,0,8])
            cube([22.6, 14.3, 1]);
}

module dsnDvm368HolePattern(r,h){
    translate([2.7,1.0+4.7+1.5, 0])
        cylinder(h, r, r);
    translate([1.5+28.5,1.0+4.7+1.5, 0])
        cylinder(h, r, r);
}

module dsnDvm368Module(){
    difference(){
        dsnDvm368Body();
        translate([0,0,-1])
            dsnDvm368HolePattern(1.5,3);
    }
}

module dsnDvm368Fixture(r, th){
    difference(){
        translate([0,0,-3]){
            dsnDvm368HolePattern(2.8,3);
            translate([0,0,3-th])
            cube([32.8, 14.3, th-3]);
        }
        translate([0,0,0-th-1])
            dsnDvm368HolePattern(r,th+2);
                
    }
}

//dsnDvm368Body();
//dsnDvm368HolePattern(1.5,10);
//dsnDvm368Module();
//dsnDvm368Fixture(3/2, 5);
