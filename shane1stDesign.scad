// first design
//shane cunningham
//31-3-2017

//definition
$fa=0.5;
$fs=0.1;

//parameters
myW = 10;
myD = 15;
myH = 20;
cylD = 14;
cylH = 9;


module blockThing()
{
    cube([myW,myD,myH], center=true);
    
}

module cylinderThing()
{
    cylinder(r=cylD/2, h=cylH, center=true);
}

module makeThing()
{
    difference()
    {
        blockThing();
        translate([0,0,myH/2 - cylH/2])
        cylinderThing();
    }
    
}

makeThing();
    