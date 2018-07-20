/// @description Draw Shader



var p, x1, x2, y1, y2, sc;

sc = scr_screen_surface_get_id( camera.screen_index );

x1 = 0;
y1 = 0;
x2 = surface_get_width(sc);
y2 = surface_get_height(sc);

for( var i = 0; i<4; i++)
{
	p[i,0] = camera.p[i,0];
	p[i,1] = camera.p[i,1];
}

uv_scale_v[0] = 1/x2;
uv_scale_v[1] = 1/y2;

if( !surface_exists(screen_height) )
	screen_height = surface_create( x2, y2 );	

if( !surface_exists(screen_normal) )
	screen_normal = surface_create( x2, y2 );
	
if( !surface_exists(screen_smooth) )
	screen_smooth = surface_create( x2, y2 );

if( !surface_exists(screen_colour) )
	screen_colour = surface_create( x2, y2 );
	
if( !surface_exists(screen_final) )
	screen_final = surface_create( x2, y2 );


// ----------------- height map shader ------------------

surface_set_target( screen_height );
shader_set( shader );

shader_set_uniform_f_array( uv_scale_uniform, uv_scale );

draw_clear_alpha(c_black,0);

var w,h;
w = room_width;
h = room_height;

draw_primitive_begin_texture( pr_trianglestrip, sprite_get_texture( uv_rev_spr, 0 ) );

draw_vertex_texture_color( x1, y1, p[0,0], p[0,1], c_white, 1 );	// P0
draw_vertex_texture_color( x2, y1, p[1,0], p[1,1], c_white, 1 );	// P1
draw_vertex_texture_color( x1, y2, p[2,0], p[2,1], c_white, 1 );	// P2
draw_vertex_texture_color( x2, y2, p[3,0], p[3,1], c_white, 1 );	// P3

draw_primitive_end();

shader_reset();
surface_reset_target();

// ------------------- height to normal ------------------

surface_set_target( screen_normal );

shader_set(sha_height_to_normal);

shader_set_uniform_f_array(uv_scale_i,uv_scale_v);
shader_set_uniform_f(strength_i,strength_v);

draw_surface(screen_height,0,0);

shader_reset();
surface_reset_target();

// ------------------- smooth normal -------------------------


// smooth normal
surface_set_target(screen_smooth)
shader_set( sha_smooth );
shader_set_uniform_f_array(uv_scale_i_2,uv_scale_v);

draw_surface(screen_normal,0,0);

shader_reset();
surface_reset_target();


// ------------------------ colour -----------------------

surface_set_target( screen_colour );

draw_clear( make_colour_rgb(205,139,67) );
//draw_surface(screen_height,0,0);

surface_reset_target();


// ------------------------ final ------------------------

surface_set_target( screen_final );

shader_set( sha_composite );

shader_set_uniform_f_array( light_direction_i, light_direction_v );
shader_set_uniform_f_array( light_colour_i, light_colour_v );

texture_set_stage( normal_sampler, surface_get_texture(screen_smooth) );

draw_surface(screen_colour,0,0);

shader_reset();
surface_reset_target();


// ------------------- final to screen ------------------

surface_set_target(scr_screen_surface_get_id( camera.screen_index ));
draw_surface(screen_final,0,0);
surface_reset_target();