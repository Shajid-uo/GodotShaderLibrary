shader_type spatial;

#include "Library/surface_normal.gdshaderinc"

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec3 gh = transforToTangent(NORMAL,TANGENT, vec3(0,0,1));
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
