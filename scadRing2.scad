// scad ring
//shane cunningham
//31-3-2017



//definition
$fa=0.5;
$fs=0.1;

//parameters
fingerCircumference = 70;
fingerRadius = fingerCircumference/(2*PI);
ringH = 4;
ringThickness = 1.5;
echo("Finger diameter" ,fingerRadius *2);
decorationBlockSize = 9;
decorationRim = 1.1;
decH = 3;

//modules

module ring()
{
    difference()
    {
        //outer block of material
        cylinder(r=fingerRadius+ringThickness, h=ringH, center=true);
        // shift to cut down a wee bit
        translate([0,0,-0.5])
        
        
        cylinder(r=fingerRadius, h=ringH+1, center=true);
        
        
        }
        
    }

module decoration()
    {
        rotate(a=90, v=[1,0,0])
        union()
        {
        cylinder(d=decorationBlockSize/2.5, h=decH);
        translate([-decorationBlockSize/2, -decorationBlockSize/2,0])
        decoBox();
        } 
    }
    
    module decoBox()
    {
       difference()
        {
        cube([decorationBlockSize,decorationBlockSize,decH]);
            
            translate([decorationRim/2,decorationRim/2,decorationRim])
        
        cube([decorationBlockSize-decorationRim, decorationBlockSize-decorationRim, decH]);
    }
}

module makeRing()
{
    union()
    {
        ring();
        translate([0,-(fingerRadius+ringThickness/2),0])
        decoration();
            }
        }
makeRing();    
    
//decoration();    