//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform float max_height;
uniform vec2 center_point;

const float PI = 3.14159265358979323846;

float hexagon( vec2 P, float h ) 
{
	P.x *= 0.57735*2.0;
	P.y += mod(floor(P.x), 2.0)*0.5;
	P = abs((mod(P, 1.0) - 0.5));
	
	float S = 1.0 - 0.25 * ( 1.0 + h * 0.2 );
	
	return smoothstep( S, 1.0, 1.0 - abs(max(P.x*1.5 + P.y, P.y*2.0) - 1.0) );
}

void main()
{	
	//float h = cos( (v_vColour.r - 1.0) * 0.5 * PI );
	float h = 1.0 - sqrt( -v_vColour.r + 1.0 );
	
	vec3 point_pos = vec3( vec2( center_point - v_vPosition), max_height - h * max_height );
	
	float R1 = max_height * 0.5 * PI * h;
	float R2 = length( point_pos ) * 0.5 * PI * h;
	
	vec2 curved_point = normalize( point_pos.xy ) * (R1 + R2) * 0.5;
	
	float hex = hexagon( mix(point_pos.xy * 0.85, curved_point, h * 0.6 ) * 0.1, h );
	
	hex = clamp( hex + smoothstep( 0.975, 1.0, v_vColour.r ) + v_vColour.r * 0.25, 0.0, 1.0 );
	
	vec4 col = mix( vec4( 0.5, 0.75, 1.0, 1 ), vec4( hex * 0.5, hex * 0.75, hex, hex ), hex );
	
	gl_FragColor = col ;
}

