vec3 quantize_color(vec3 color,int level){

	return ceil(color*float(level))/float(level);
}