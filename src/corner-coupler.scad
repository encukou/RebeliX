// RebeliX-T3DD
//
// corner-coupler
// GNU GPL v3
// Marek Žehra <marek@zehra.cz>
// http://www.tiskni3ddoma.cz
// Inspired by RebeliX

include <../configuration.scad>

module rounded_cube(size=[20,10,10],corner_radius=2){
    translate([corner_radius,corner_radius,0])hull(){
        for(x=[0,size[0]-corner_radius*2],y=[0,size[1]-corner_radius*2]) {
            translate([x,y,0])cylinder(r=corner_radius,h=size[2]);
        }
    }
}


module mount_jig(size=[30,8,2],middle_space=8) {
    rounded_cube(size=[size[0]/2-middle_space/2,size[1],size[2]],corner_radius=3);
    translate([size[0]/2+middle_space/2,0,0])
    rounded_cube(size=[size[0]/2-middle_space/2,size[1],size[2]],corner_radius=3);
}

module corner_coupler(size=[60,30,4],mount_hole_width=8,mount_height=2) {
  difference(){
	union(){
		rounded_cube([size[0],size[1],size[2]],corner_radius=0.5,$fn=15);
		
        translate([0,size[1]/2-mount_hole_width/2,size[2]])
        mount_jig(size=[size[1]-1,mount_hole_width,mount_height],middle_space=11,$fn=30);
        translate([size[0]/2+size[1]/2+mount_hole_width/2,0,size[2]])
        rotate([0,0,90])mount_jig(size=[size[1],mount_hole_width,mount_height],middle_space=10,$fn=30);
	}
		
	// Otvory pro srouby
    translate([size[1]/2,size[1]/2,-1]){
        cylinder(h=size[2]+2,r=M6_dia/2,$fn=30);
        translate([size[0]/2,0,0])cylinder(h=size[2]+2,r=M6_dia/2,$fn=30);
    }
  }
}

corner_coupler(size=[60,30,coupler_thickness],mount_hole_width=alu_hole_width,mount_height=2);