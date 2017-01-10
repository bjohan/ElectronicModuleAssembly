module shelfBody(sx, sy, sz,th){
    cube([10, sy, sz+th]);
    translate([10, 0,0])
        cube([sx, sy, th]);
    translate([sx+10, 0,0])
        cube([10, sy, sz+th]);
}

module shelfHeadHolePattern(sx, sy, sz,r,h){
    translate([5, 5,0])
        cylinder(h, r, r);
    translate([5, sy-5,0])
        cylinder(h, r, r);
    //translate([5, sy/2,0])
    //    cylinder(h, r, r);
    translate([sx+20-5, sy/2,0])
        cylinder(h, r, r);
}

module shelfThreadHolePattern(sx, sy, sz,r,h){
    translate([sx+20-5, 5,0])
        cylinder(h, r, r);
    translate([sx+20-5, sy-5,0])
        cylinder(h, r, r);
    //translate([5, sy/2,0])
    //    cylinder(h, r, r);
    translate([5, sy/2,0])
        cylinder(h, r, r);
}

module shelfModuleEven(sx, sy, sz, th, r){
    headDepth = 3;
    difference(){
        shelfBody(sx, sy, sz, th);
        translate([0,0,-1]){
            shelfHeadHolePattern(sx, sy, sz, r+0.5, th+sz+2);
            shelfThreadHolePattern(sx, sy, sz, r, th+sz+2);
        }
        translate([0, 0, sz+th-headDepth])
            shelfHeadHolePattern(sx, sy, sz, 4, headDepth+1);
        
    }
}

module shelfModuleOdd(sx, sy, sz, ,th, r){
    translate([sx+20, 0, 0])
        mirror([1,0,0])
            shelfModuleEven(sx, sy, sz, th, r);
    
}

shelfModuleEven(80, 40, 15, 4, 3/2);

translate([0,0,50]){
    shelfModuleOdd(80, 40, 15, 4, 3/2);
}