//
// ktRACK56
//
//

gap1 = 0.002;
gap2 = 0.004;

th = 2;



difference()
{
    union()
    {
        translate([0, 75+52, 0]) cube([(100+1)+5*2, 8, 24]);
        translate([0, 75+30, 0]) cube([(100+1)+5*2, 5, 35]);

        translate([0,  5+52, 0]) cube([(100+1)+5*2, 8, 24]);
        translate([0,  5+30, 0]) cube([(100+1)+5*2, 5, 35]);

        translate([0,  5+30, 0]) cube([(100+1)+5*2, 132, 5]);
    }
    #translate([5, 75, 45]) rotate([-25, 0, 0]) HUB_UNIT();
    #translate([5,  5, 45]) rotate([-25, 0, 0]) HUB_UNIT();
    
    translate([5+5, 135, -gap1]) cube([(100+1)-5*2, 25+10, 100]);
    translate([5+5, 100, -gap1]) cube([(100+1)-5*2, 27, 100]);
    translate([5+5, 65, -gap1]) cube([(100+1)-5*2, 25+10, 100]);
    translate([5+5, 7, -gap1]) cube([(100+1)-5*2, 50, 100]);
    
    #translate([(100+1)+5*2-5, 120, -gap1]) cylinder(h=14, r=4/2, $fn=100);
    #translate([5, 120, -gap1]) cylinder(h=14, r=4/2, $fn=100);


    #translate([-gap1, 131, 10]) rotate([0, 90, 0]) cylinder(h=(100+1)+5*2+gap2, r=5/2, $fn=100);
    #translate([-gap1, 61, 10]) rotate([0, 90, 0]) cylinder(h=(100+1)+5*2+gap2, r=5/2, $fn=100);
}




/*
difference()
{
    union()
    {
        translate([0,    0, 0]) cube([(100+1)+th*2, 170, 22]);
        translate([0,     0, 0]) cube([(100+1)+th*2, 10, 45+5]);
    }
    #translate([th, 5+70, 45]) rotate([-25, 0, 0]) HUB_UNIT();
    #translate([th, 5, 45]) rotate([-25, 0, 0]) HUB_UNIT();
    
    translate([th+5, 135, -gap1]) cube([(100+1)-5*2, 27, 100]);
    translate([th+5, 100, -gap1]) cube([(100+1)-5*2, 27, 100]);
    translate([th+5, 65, -gap1]) cube([(100+1)-5*2, 25, 100]);
    translate([th+5, 7, -gap1]) cube([(100+1)-5*2, 50, 100]);
}
*/


/*

difference()
{
    union()
    {
        translate([0, 100, 0]) rotate([-20, 0, 0]) BASE();
        translate([0,   0, 0]) rotate([-20, 0, 0]) BASE();
        translate([0,   0, 0]) WAKU(105, 37);
    }
}

*/

module WAKU(Y=98+5*2, Z=10)
{
X = 100+5*2;
translate([0, 0, -Z])
difference()
{
    union()
    {
        cube([X, Y, Z]);
    }
    translate([-gap1, 5,     5    ]) cube([X+gap2, Y-5*2,  Z-5*2]);
    translate([5,     -gap1, 5    ]) cube([X-5*2,  Y+gap2, Z-5*2]);
    translate([5,     5,     -gap1]) cube([X-5*2,  Y-5*2,  Z+gap2]);
}
}


module BASE()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([100+5*2, 98+5*2, 10]);
    }
    translate([5*2, 70,  -gap1]) cube([100-5*2, 30, 10]);
    translate([5*2, 5*2, -gap1]) cube([100-5*2, 60-5, 10]);
    
    translate([5, 5, 5]) HUB_UNIT();

}
}



module HUB_UNIT()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([100+1, 98, 25]);
    }
    translate([(100+1)/2-25/2-13, 60+0.5, 0]) cube([13, 3, 3]);
    translate([(100+1)/2+25/2   , 60+0.5, 0]) cube([13, 3, 3]);
}
}

module SW_UNIT()
{
translate([-(14-0.25)/2, -14/2, 0])
difference()
{
    union()
    {
        translate([0, 0, -50]) cube([100, 98, 25]);
        translate([14, 14, -1.5]) rotate([90, 0, 0]) cylinder(h=14, r=1, $fn=3);
        translate([0, 0, -1.5]) rotate([90, 0, 180]) cylinder(h=14, r=1, $fn=3);
    }
}
}

module SWBT_UNIT(RR=6)
{
difference()
{
    union()
    {
        $fn=100;
        translate([-(37.5-RR*2)/2, -(43.5-RR*2)/2, 0])
        minkowski()
        {
            cube([37.5-RR*2, 43.5-RR*2, 12.5-1+gap1]);
            cylinder(r=RR, h=1);
        }
        translate([-27/2, -27/2, -50+gap1]) cube([27, 27, 50]);
    }
}
}

module AQARA_UNIT(RR=9)
{
difference()
{
    union()
    {
        $fn=100;
        translate([-(45-RR*2)/2, -(45.1-RR*2)/2, 0])
        minkowski()
        {
            cube([45-RR*2, 45.1-RR*2, 12-1+gap1]);
            cylinder(r=RR, h=1);
        }
        translate([0, 0, -(20-1)+gap1]) cylinder(h=20, r=40/2, $fn=100);
    }
}
}

module M5ATOM_UNIT(RR=3.5)
{
difference()
{
    union()
    {
        $fn=100;
        translate([-(24.6-RR*2)/2, -(24.6-RR*2)/2, 0])
        minkowski()
        {
            cube([24.6-RR*2, 24.6-RR*2, 9.5-1+gap1]);
            cylinder(r=RR, h=1);
        }
        translate([-15/2, -15/2, -50+gap1]) cube([15, 15, 50]);
        
        translate([-8.5/2, 24.6/2, 9.5-2.5]) cube([8.5, 2+gap2, 2.5+gap1]);
    }
}
}

module NEJI_TOP()
{
difference()
{
    union()
    {
        translate([0, 0, 1]) cylinder(h=20, r=6/2, $fn=100);
        translate([0, 0, -(20-1)+gap1]) cylinder(h=20, r=3.5/2, $fn=100);
    }
}
}
module NEJI_BOTTOM(H=5)
{
difference()
{
    union()
    {
        translate([-6/2, -6/2, -H]) cube([6, 6, H]);
    }
    translate([-5/2, -5/2, -3-1]) cube([5.75, 5.75, 2.5]);
    
    translate([0, 0, -(H-1)+gap1]) cylinder(h=H-1, r=3.5/2, $fn=100);
}
}
module NEJI_BOTTOM2(H=5)
{
difference()
{
    translate([-5/2, -5/2, -3-1]) cube([5.75, 5.75, 2.5]);
}
}