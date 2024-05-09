// RebeliX
//
// profile cover
// GNU GPL v3
// Martin Neruda <neruda@reprap4u.cz>
// http://www.reprap4u.cz

include <../configuration.scad>

block_size=9.8;

difference(){
	union(){
		cube([30,30,4*layer_height]);
		translate([15-4.75,15-4.75,0]) cube([block_size,block_size,5]);
	}	
	// Nabeh
	translate([0,15-block_size/2,4.7]) rotate([45,0,0]) cube([40,3,3]);
	translate([0,15+block_size/1.9,4.7]) rotate([45,0,0]) cube([40,3,3]);
	translate([15-block_size/2,0,4.7]) rotate([45,0,90]) cube([40,3,3]);
	translate([15+block_size/1.9,0,4.7]) rotate([45,0,90]) cube([40,3,3]);
}	