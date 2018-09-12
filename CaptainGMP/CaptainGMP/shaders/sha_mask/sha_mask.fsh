//
// Masking fragment shader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform vec2 texture_scale;

uniform sampler2D base_surface;

void main()
{	
	vec4 base_color = texture2D( gm_BaseTexture, v_vTexcoord );
	
	gl_FragColor = vec4( base_color.r, base_color.g, base_color.b, base_color.a * texture2D( base_surface, v_vPosition * texture_scale ).a * v_vColour.a );
}

