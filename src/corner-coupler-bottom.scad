// RebeliX
//
// corner-coupler-bottom
// GNU GPL v3
// Martin Neruda <neruda@reprap4u.cz>
// http://www.reprap4u.cz
// Inspired by Rebel II

include <../configuration.scad>
use <corner-coupler.scad>
//import("/Users/marek/ownCloud/ČVUT/Tiskni 3D Doma/RebeliX/STLs/corner-coupler-bottom_left.stl");


module corner_coupler_bottom(size=[60,30,coupler_thickness],mount_hole_width=alu_hole_width,mount_height=2,rubber_feet_d = 20) {
    corner_coupler(size,mount_hole_width,mount_height);
    
    translate([size[0]/2+size[1]/2,0,0])
    difference(){
        union(){
            hull(){
                cylinder(r=rubber_feet_d/2,h=coupler_thickness,$fn=40);    
                translate([0,-rubber_feet_d/4,0])cylinder(r=rubber_feet_d/2,h=coupler_thickness,$fn=40);
            }
            translate([-mount_hole_width/2,-rubber_feet_d/2,size[2]])rounded_cube([mount_hole_width,rubber_feet_d/4*3,mount_height],corner_radius=3,$fn=30);
        }
        translate([0,-rubber_feet_d/4,-1])cylinder(r=1.5,h=coupler_thickness+mount_height+2,$fn=20);
    }
}

corner_coupler_bottom();
translate([0,62,0])
mirror([0,1,0])
corner_coupler_bottom();