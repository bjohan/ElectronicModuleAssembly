use <shelf.scad>
use <dk-nano-003.scad>
use <jy-mcy-bt-board-v105.scad>
use <dsn-dvm-368.scad>
use <gy-89.scad>

dkNanoPos=[10, 0, 5];
btPos=[65, 0, 5];
dispPos = btPos+[20,40,0];
sensPos = btPos+[30,0,0];

module rotorFixtureBody(){
    shelfModuleEven(110, 60, 30, 2, 3/2);
    translate(dkNanoPos)
        dkNano003Fixture(3/2, 5);
    translate(btPos)
        jyMcuBtBoardV105Fixture(3/2, 5);
    translate(dispPos)
        dsnDvm368Fixture(3/2, 5);
    translate(sensPos)
        gy89Fixture(3/2, 5);
}

module rotorFixtureModules(){
    translate(dkNanoPos)
        dkNano003Module(3/2, 5);
    translate(btPos)
        jyMcuBtBoardV105Module(3/2, 5);
    translate(dispPos)
        dsnDvm368Module(3/2, 5);
    translate(sensPos)
        gy89Module(3/2, 5);
}

module rotorFixtureHolePattern(h){
    translate(dkNanoPos)
        dkNano003HolePattern(3/2, h);
    translate(btPos)
        jyMcuBtBoardV105HolePattern(3/2, h);
    translate(dispPos)
        dsnDvm368HolePattern(3/2, h);
    translate(sensPos)
        gy89HolePattern(3/2, h);
}

module rotorFixtureModule(){
    difference(){
        rotorFixtureBody();
        translate([0,0,-20])
            rotorFixtureHolePattern(60);
    }
}
rotorFixtureModule();
rotorFixtureModules();