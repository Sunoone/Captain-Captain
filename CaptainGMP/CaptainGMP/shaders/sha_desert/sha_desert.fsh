//
// Voronoi fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

const float M_PI = 3.14159265358979323846;

uniform vec2 uv_scale;

//uniform vec2 u_resolution;
//uniform float u_time;

float rand(float n)
{
	return fract(sin(n) * 43758.5453123);
}

float rand(vec2 n) 
{ 
	return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

vec2 random2( vec2 P ) 
{
    return fract(sin(vec2(dot(P,vec2(127.1,311.7)),dot(P,vec2(269.5,183.3))))*43758.5453);
}

float voronoi( vec2 P, vec2 S, float m_dist )
{
	P = ( P / vec2(1024.0) ) * S;
	
	// Tile the space
    vec2 i_st = floor(P);
    vec2 f_st = fract(P);
	
	for (int v = -1; v <= 1; v++) {
        for (int u = -1; u <= 1; u++) {
            // Neighbor place in the grid
            vec2 neighbor = vec2(float(u),float(v));

            // Random position from current + neighbor place in the grid
            vec2 point = random2(i_st + neighbor);

			// Animate the point
            //point = 0.5 + 0.5*sin(u_time + 6.2831*point);

			// Vector between the pixel and the point
            vec2 diff_uv = neighbor + point - f_st;

            // Distance to the point
            float dist = length(diff_uv);

            // Keep the closer distance
            m_dist = min(m_dist, dist);
        }
    }
	
	// return the min distance (distance field)	
	return m_dist;
}

float noise(vec2 P)
{
	vec2 ip = floor(P);
	vec2 u = fract(P);
	u = u*u*(3.0-2.0*u);
	
	float res = mix(
		mix(rand(ip),rand(ip+vec2(1.0,0.0)),u.x),
		mix(rand(ip+vec2(0.0,1.0)),rand(ip+vec2(1.0,1.0)),u.x),u.y);
		
	return res*res;
}

float fbm_so(vec2 X, float S, int O) 
{
	X = X * S;
	
	float V = 0.0;
	float A = 0.5;
	vec2 shift = vec2(100);
	
	for (int i = 0; i < O; ++i) 
	{
		V += A * noise(X);
		X = X * 2.0 + shift;
		A = A * 0.5;
	}
	
	return V;
}

vec2 warp( vec2 P, float S )
{					
	return vec2( fbm_so( P + vec2(2.2,3.5), S, 2 ), fbm_so( P + vec2(5.2,1.6), S, 2 ) );
}

vec2 drift( vec2 P, float dist )
{
	return P + vec2(dist) * (0.9 + 0.1  * warp( P, 0.04 ) );
}

void main() 
{
	vec2 fragment_pos = v_vTexcoord / uv_scale;
	
	float dr = 300.0;
	vec2 sc = vec2(0.25,0.25);
	
	//vec2 pos1 = drift( sc * v_vTexcoord, dr);
	vec2 pos2 = drift( sc * fragment_pos + vec2(8712.2, 9781.3) , dr );
	
	//float v_d = 1.0-voronoi( pos1, vec2(25.0), 1.0 );
	//float c_d = 1.0+ pow(-(v_d-1.0),2.0);
	//float d = mix( v_d, c_d, v_d );
	//d = clamp( d, 0.0, 0.925 );
	
	float v_u = 1.0 - voronoi( pos2, vec2(25.0), 1.0 );
	float c_u = 1.0+ pow(-(v_u-1.0),2.0);
	float u = 1.0 - mix( v_u, c_u, v_u );
	u = clamp( u, 0.025, 1.0 );
	
	float n = pow(-(noise( sc * fragment_pos * 0.04 )-1.0),2.5);
	n = 0.5*(1.0-cos(n*M_PI));
	//float m = 0.25 + 0.75 * noise( sc * v_vTexcoord * 0.01 );
	
	vec3 col = vec3( u*n, n, clamp(u*10.0,0.0,1.0) );
	
    gl_FragColor = vec4(col,1.0);
}

