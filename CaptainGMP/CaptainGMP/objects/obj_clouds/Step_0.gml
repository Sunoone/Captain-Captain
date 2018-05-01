/// @description check surface

if( !instance_exists( camera )  )
	exit;

camera_zoom = camera.scale;
	
if( !surface_exists( background ) )
{
	background = scr_screen_surface_get_id( camera.screen_index );
	b_width = surface_get_width( background );
	b_height = surface_get_height( background );
	
	d_x2 = b_width - 10;
	d_y1 = debug_height + 10;
	d_x1 = d_x2 - 100;
	d_y2 = d_y1 + 100;
}

surface_set_target( background );

	
var spr, col, u_off, v_off, x1,y1,x2,y2,p;

spr = spr_cloud;
col = c_white;

x1 = draw_left;
y1 = draw_top;
x2 = b_width;
y2 = b_height;

for( var i = 0; i<4; i++)
{
	p[i,0] = camera.x + (camera.p[i,0] - camera.x) * scale + background_x;
	p[i,1] = camera.y + (camera.p[i,1] - camera.y) * scale + background_y;
}

uv_scale = vector_create( (scale/50)*camera_zoom , (scale/50)*camera_zoom );

shader_set( sha_cloud );

	// set shader uniforms
shader_set_uniform_i( iteration_uniform, iterations );
shader_set_uniform_f_array( light_direction_uniform, light_direction );
shader_set_uniform_f_array( light_colour_uniform, light_colour );
shader_set_uniform_f_array( uv_scale_uniform, uv_scale );



draw_primitive_begin_texture( pr_trianglestrip, sprite_get_texture( spr, 0 ) );


draw_vertex_texture_color( x1, y1, p[0,0], p[0,1], col, 1 );	// P0
draw_vertex_texture_color( x2, y1, p[1,0], p[1,1], col, 1 );	// P1
draw_vertex_texture_color( x1, y2, p[2,0], p[2,1], col, 1 );	// P2
draw_vertex_texture_color( x2, y2, p[3,0], p[3,1], col, 1 );	// P3


draw_primitive_end();
	
shader_reset();

surface_reset_target();
