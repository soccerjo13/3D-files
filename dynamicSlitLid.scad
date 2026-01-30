difference() {
    fullHeight = 5;
    outerRadius = 61;
    innerRadius = outerRadius - 2;
    slitLength = 30;
    slitWidth = 15;
    spacing = 5;
    
    // full cylinder
    cylinder(fullHeight, outerRadius, outerRadius);
    
    // cut-out to make lid-shaped
    cylinder(fullHeight - 1, innerRadius, innerRadius);
    
    addSlits(outerRadius, slitLength, slitWidth, fullHeight, spacing);
}

module addSlits (outerRadius, slitLength, slitWidth, fullHeight, spacing) {
    cube([slitLength, slitWidth, fullHeight + .001]);
}


module addHoles (outerRadius, holeRadius, fullHeight, gapBetweenHoles) {
    r = outerRadius - holeRadius - gapBetweenHoles;
    echo(r=r);
    
    if (r > holeRadius) {
        n = floor((2*PI*r)/(2*holeRadius + gapBetweenHoles));
        step = 360/n;
    
        for (i=[0:step:359]) {
                angle = i;
                dx = r*cos(angle);
                dy = r*sin(angle);
                translate([dx,dy,0])
                    cylinder(fullHeight + .001, holeRadius, holeRadius);
            }
            
        addHoles(r - holeRadius, holeRadius, fullHeight, gapBetweenHoles);
        }
    }