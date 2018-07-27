//
// Render Clouds
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform int iterations;
uniform vec2 uv_scale;
uniform vec3 light_direction;
uniform vec3 light_colour;

const float PI = 3.14159265358979323846;

float rand(vec2 m)
{
	return fract(sin(dot(m.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

float noise(vec2 k, float freq )
{
	float unit = 1.0 / freq;
	vec2 ij = floor(k/unit);
	vec2 mx = mod(k,unit)/unit;
	//xy = 3.*xy*xy-2.*xy*xy*xy;
	mx = 0.5*(1.0-cos(PI*mx));
	float j = rand((ij+vec2(0.0,0.0)));
	float h = rand((ij+vec2(1.0,0.0)));
	float c = rand((ij+vec2(0.0,1.0)));
	float d = rand((ij+vec2(1.0,1.0)));
	float x1 = mix(j, h, mx.x);
	float x2 = mix(c, d, mx.x);
	return mix(x1, x2, mx.y);
}

float pNoise(vec2 l, int rep )
{
	float persistance = 0.5;
	float n = 0.0;
	float normK = 0.0;
	float f = 2.0;
	float amp = 1.0;
	int iCount = 0;
	for (int i = 0; i<100; i++){
		n+=amp*noise(l, f);
		f*=2.0;
		normK+=amp;
		amp*=persistance;
		if (iCount == rep) break;
		iCount++;
	}
	float nf = n/normK;
	return clamp(nf*nf*nf*nf*2.0, 0.0, 1.0);
}

void main()
{	
	float n_strength = 5.0;
	
	float p_a = pNoise( v_vTexcoord, iterations );
	float p_u = pNoise( vec2( v_vTexcoord.x - uv_scale.x, v_vTexcoord.y ), iterations ) * n_strength;
	float p_d = pNoise( vec2( v_vTexcoord.x + uv_scale.x, v_vTexcoord.y ), iterations ) * n_strength;
	float p_l = pNoise( vec2( v_vTexcoord.x, v_vTexcoord.y - uv_scale.y), iterations ) * n_strength;
	float p_r = pNoise( vec2( v_vTexcoord.x, v_vTexcoord.y + uv_scale.y), iterations ) * n_strength;
	
	
	vec3 va = normalize( vec3( 2.0, 0.0, p_d-p_u ) );
    vec3 vb = normalize( vec3( 0.0, 2.0, p_r-p_l ) );
	
    vec3 normal = vec3( cross( va, vb ) );
	normal.z = p_a;
	normal += vec3( 1.0, 1.0, 1.0 );
	normal *= vec3( 0.5, 0.5, 0.5 );
	normal = normalize( normal );
	
	vec3 light = normalize( light_direction );
	vec3 cloud_colour = vec3( 1.0, 1.0, 1.0 );
	float cosTheta = clamp(dot( normal, light ), 0.0, 1.0);
	
	vec3 output_colour = pow(cosTheta, 2.0 )* cloud_colour * light_colour;
	
	gl_FragColor = v_vColour * vec4( output_colour, p_a );
	//gl_FragColor = v_vColour * vec4( normal, 1.0 );
}

