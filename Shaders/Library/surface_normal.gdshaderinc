	#define GL_OES_standard_derivatives 1
	
	vec3  ComputeSurfaceGradient(vec3 n, vec3 dpdx, vec3 dpdy, float dhdx, float dhdy)
{
	vec3 r1 = cross(dpdy, n);
	vec3 r2 = cross(n, dpdx);

	return (r1 * dhdx + r2 * dhdy) / dot(dpdx, r1);
}

// Move the normal away from the surface normal in the opposite surface gradient direct
vec3 PerturbNormal(vec3 n, vec3 dpdx, vec3 dpdy, float dhdx, float dhdy)
{
	return normalize(n - ComputeSurfaceGradient(n, dpdx, dpdy, dhdx, dhdy));
}

// Returns the surface normal using screen-space partial derivatives of the height field.
vec3 ComputeSurfaceNormal(vec3 position, vec3 normal, float height)
{

	vec3 dpdx = dFdx(position);
	vec3 dpdy = dFdy(position);

	float dhdx = dFdx(height);
	float dhdy = dFdy(height);

	return PerturbNormal(normal, dpdx, dpdy, dhdx, dhdy);
}

vec3 transforToTangent(vec3 nrm,vec3 tang,vec3 nor_in){
	
	vec3 bitangent = normalize(cross(tang,nrm));
    mat3 TBN = mat3(tang,bitangent,normalize(nrm));
	
	vec3 fin = TBN*nor_in;
	
	return fin;
}