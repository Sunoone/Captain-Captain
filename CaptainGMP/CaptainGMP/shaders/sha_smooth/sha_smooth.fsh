//
// smoothing fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform vec2 uv_scale;

void main()
{
	//gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec2 uv_u = vec2(v_vTexcoord.x, v_vTexcoord.y - uv_scale.y);
	vec2 uv_d = vec2(v_vTexcoord.x, v_vTexcoord.y + uv_scale.y);
	vec2 uv_l = vec2(v_vTexcoord.x - uv_scale.x, v_vTexcoord.y);
	vec2 uv_r = vec2(v_vTexcoord.x + uv_scale.x, v_vTexcoord.y);
	
	vec4 A = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 U = texture2D( gm_BaseTexture, uv_u );
	vec4 D = texture2D( gm_BaseTexture, uv_d );
	vec4 L = texture2D( gm_BaseTexture, uv_l );
	vec4 R = texture2D( gm_BaseTexture, uv_r );
	
	vec4 smoothed = ( A + U + D + L + R ) * 0.2; 
	
	gl_FragColor = v_vColour * smoothed;
}

