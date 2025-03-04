vec3 diretional_warp_texture(sampler2D TexSampler,vec3 value,vec2 coord,vec2 noise,float dir,float angle){

vec2 distuv = vec2(sin(dir*angle),cos(dir*angle));
float strenth =value.x;
float dist = value.y;
float push = value.z;

vec4 texColor = texture(TexSampler,coord+(noise.xy*strenth*dist*push));

    return texColor.rgb;
	
	}
	
vec3 ray_bump(sampler2D TexSampler,vec3 Ray,vec2 uv){
vec2 raystep = Ray.xy*-1.0;
vec4 color = texture(TexSampler,uv);


for(int i =0; i<8; i++){
uv +=raystep*0.35;

color += texture(TexSampler,uv.xy);

}

return color.rgb;

}