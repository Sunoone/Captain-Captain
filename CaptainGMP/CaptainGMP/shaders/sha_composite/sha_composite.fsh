//
// Compositing fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D input_normal;

uniform vec3 light_direction;
uniform vec3 light_colour;


void main()
{
    vec4 colour = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 normal = texture2D( input_normal, v_vTexcoord );
	
	vec3 light = normalize( light_direction );
	float cosTheta = clamp( dot( normal.rgb, light ), 0.0, 1.0);
	
	vec4 output_colour = vec4( vec3( pow(cosTheta, 2.0 ) ) * colour.rgb * light_colour, colour.a );
	
	gl_FragColor = v_vColour * output_colour;
}

