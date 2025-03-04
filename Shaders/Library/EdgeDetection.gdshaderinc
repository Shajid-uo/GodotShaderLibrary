mat3 TangentSpace(vec3 tangent,vec3 bitangent,vec3 normal){
	
	return mat3(tangent,bitangent,normal);
}

vec3 TanToWorld(vec3 vec){
	
	return vec;
}

vec3 ProcedEdgeDetect(vec3 wpo,vec3 nrm){
	
	vec3 dwx = dFdx(wpo);
	vec3 dwy = dFdy(wpo);
	
	vec3 dw = cross(dwx,dwy);
	
	float curv = distance(dw,nrm);
	
	return vec3(curv);
}