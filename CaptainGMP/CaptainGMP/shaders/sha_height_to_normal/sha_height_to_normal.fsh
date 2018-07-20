//
// Height to Normal fragment shader
//
varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec4 v_vColour;

uniform vec2 uv_scale;
uniform float strength;

vec3 height2normal( vec2 Texcoord, vec2 Uvscale, int f )
{	
	vec4 Pa = texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 end_normal = vec3(0.0);
	
	for( int i = 1; i <= f; ++i  )
	{
		vec2 uv_off = Uvscale * float(i);
		
		vec2 uv_u = vec2(Texcoord.x, Texcoord.y - uv_off.y );
		vec2 uv_d = vec2(Texcoord.x, Texcoord.y + uv_off.y);
		vec2 uv_l = vec2(Texcoord.x - uv_off.x, Texcoord.y);
		vec2 uv_r = vec2(Texcoord.x + uv_off.x, Texcoord.y);
	
		vec4 Pu = texture2D( gm_BaseTexture, uv_u );
		vec4 Pd = texture2D( gm_BaseTexture, uv_d );
		vec4 Pl = texture2D( gm_BaseTexture, uv_l );
		vec4 Pr = texture2D( gm_BaseTexture, uv_r );
	
		float sf = strength * 0.2 * (Pa.b + Pu.b + Pd.b + Pl.b + Pr.b);
	
		Pu.r *= sf;
		Pd.r *= sf;
		Pl.r *= sf;
		Pr.r *= sf;
		
		vec3 vb = normalize( vec3( 2.0, 0.0, Pd.r-Pu.r ) );
	    vec3 va = normalize( vec3( 0.0, 2.0, Pr.r-Pl.r ) );
	
		vec3 normal = vec3( cross( va, vb ) );
	
		normal.z = 0.5;
		normal += vec3( 1.0, 1.0, 1.0 );
		normal *= vec3( 0.5, 0.5, 0.5 );
		normal = normalize( normal );
		
		end_normal += normal / float(f);
	}
	
	return normalize(end_normal);
	
}

void main()
{		
	vec3 normal = height2normal( v_vTexcoord, uv_scale, 3 );
	
	gl_FragColor = vec4( normal.xyz, 1.0 );
}

