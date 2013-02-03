// Base teardrop shape, one end centred on origin, extending for given distance
// (positive or negative) along the Z axis.
//
// l = length of shape (negative extends in -z direction)
// d = diameter of hole
// q = quadrant orientation of point: 
//       0 => +x
//       1 => +y
//       2 => -x
//       3 => -y
//
module TeardropZ(l,d,q)
{
    zl = abs(l);
    zo = min(0,l);
    translate([0,0,zo])
    {
        cylinder(r=d/2,h=zl);
        rotate([0,0,-45+q*90]) cube([d/2,d/2,zl]);
    }
}

// Teardrop shape aligned along X-axis.
//
// Use for making horizontal holes in objects.
//
// l = length of shape (negative extends in -x direction)
// d = diameter of hole
// q = quadrant orientation of point: 
//       0 => +z
//       1 => +y
//       2 => -z
//       3 => -y
module TeardropX(l,d,q)
{
    rotate([0,-90,0]) TeardropZ(-l,d,q);
}

// Teardrop shape aligned along Y-axis.
//
// Use for making horizontal holes in objects.
//
// l = length of shape (negative extends in -y direction)
// d = diameter of hole
// q = quadrant orientation of point: 
//       0 => +z
//       1 => +x
//       2 => -z
//       3 => -x
module TeardropY(l,d,q)
{
    rotate([90,0,0]) TeardropZ(-l,d,-q+1);
}

// Teardrop aligned along Y axis, between given x, y, and z coordinates
// [x, y1, z] to [x, y2, z]
// Teardrop point to +Z
module teardropY2(x, y1, y2, z, r)
{
  h = y2-y1;
  translate([x,y2,z])
  {
    rotate([90,0,0])
    {
      cylinder(r=r,h=h, $fn=8);
      rotate([0,0,45])
        cube(size=[r, r, h]) ;
    }
  }
}

// Examples
TeardropZ(30,10,1,$fn=12);
TeardropX(30,10,0);
TeardropY(30,10,0);
