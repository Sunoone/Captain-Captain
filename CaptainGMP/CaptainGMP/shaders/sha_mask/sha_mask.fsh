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
	gl_FragColor = texture2D( base_surface, v_vPosition * texture_scale ) * texture2D( gm_BaseTexture, v_vTexcoord ) * v_vColour;
}

