
// Function to generate a pseudo-random float from a seed
float random_ins(float seed) {
    return fract(sin(seed) * 43758.5453);
}

vec4 perinstance_random(int rand){
    // Use the instance ID to generate a unique seed
    int instanceID = rand;
    float seed = float(instanceID) * 0.1;

    // Generate random RGB values
    float r = random_ins(seed);
    float g = random_ins(seed + 1.0);
    float b = random_ins(seed + 2.0);

   vec4 fragColor = vec4(r, g, b,1);

   return fragColor;

}

vec3 rgb2hsv(vec3 rgb)
{
	vec3 c = rgb;
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 desaturate(vec3 color,float DesaturationFactor){
	
	float grayscale = dot(color.rgb, vec3(0.299, 0.587, 0.114));
	vec3 desaturatedColor = mix(color, vec3(grayscale), DesaturationFactor);
	
	return desaturatedColor;

	
}

vec3 color_control(vec3 color,vec3 tint,float Brightness,float contrast,float Saturation){
	
	vec3 sat = desaturate(color,1.0-Saturation);
	vec3 res = sat*tint*Brightness;
	vec3 r = pow(res,vec3(contrast));
	return r;
}


float flip_flop(vec3 norm,vec3 cam_dir,float Falloff ){
float Exponent = Falloff < 0.5 ?
1.0/(1.0+18.0 * (0.5-Falloff)) :
1.0+18.0* (Falloff-0.5);

float NoV = dot(norm,cam_dir);
float LerpFactor = pow(1.0-NoV, Exponent);
return LerpFactor;

}


