
struct Transformation{
	vec3 tangent;
	vec3 binormal;
	vec3 normal;
};

vec3 tangentToWorld(vec3 norm,Transformation tf){

	mat3 tbn = mat3(tf.tangent, tf.binormal, tf.normal);
	vec3 res= normalize(tbn * norm);

	return res;
}

vec2 camSpacecoord(vec3 cam,Transformation tf){
	vec3 x = vec3(1,0,0);
	vec3 y = vec3(0,1,0);

	vec3 twx = normalize(tangentToWorld(x, tf));
	vec3 twy = normalize(tangentToWorld(y, tf));

	float u = dot(twx,cam);
	float v = dot(twy,cam);

	return vec2(u,v);

}

vec2 rotate_xy(vec2 tex_coord,float angle){
	vec2 u = vec2(cos(angle),-sin(angle));
	vec2 v = vec2(sin(angle),cos(angle));
	mat2 rot = mat2(u,v);

	vec2 res = rot*tex_coord;
	return res;

}



vec2 uv_scale(vec2 uv){

vec2 ha = floor(uv-vec2(0.5,0.5));

return uv;
}
