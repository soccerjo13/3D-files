difference() {
    fullHeight = 7;
    outerRadius = 62;
    innerRadius = outerRadius - 2;
    holeRadius = 15/2;
    gapBetweenHoles = 5;
    
    // full cylinder
    cylinder(fullHeight, outerRadius, outerRadius);
    
    // cut-out to make lid-shaped
    cylinder(fullHeight - 1, innerRadius, innerRadius);
    
    addHoles(outerRadius, holeRadius, fullHeight, gapBetweenHoles);
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