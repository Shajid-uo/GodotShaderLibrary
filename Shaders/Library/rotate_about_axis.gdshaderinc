
mat4 rotateAroundAxis( vec3 axis,float angle) {
    axis = normalize(axis);
    float c = cos(angle);
    float s = sin(angle);
    float t = 1.0 - c;

vec4 r1 = vec4(t * axis.x * axis.x + c,          t * axis.x * axis.y - s * axis.z, t * axis.x * axis.z + s * axis.y, 0.0);
vec4 r2 = vec4(t * axis.x * axis.y + s * axis.z,  t * axis.y * axis.y + c,          t * axis.y * axis.z - s * axis.x, 0.0);
vec4 r3 = vec4(t * axis.x * axis.z - s * axis.y,  t * axis.y * axis.z + s * axis.x, t * axis.z * axis.z + c,          0.0);
vec4 r4 = vec4(0.0,0.0,0.0,1.0);

    return transpose(inverse(mat4(r1,r2,r3,r4)));
}

