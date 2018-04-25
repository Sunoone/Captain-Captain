/// @description check surface

if( !surface_exists( background ) )
{
	background = surface_create(b_width, b_height);
}

surface_set_target( background );
	
draw_clear( make_color_rgb( 132, 187, 232 ) );
	
var spr, h_off, col, u_min, v_min, u_max, v_max, u_off, v_off, x1,y1,x2,y2;

spr = spr_cloud;
h_off = debug_height * debug_enabled;
col = c_white;



x1 = draw_left;
y1 = draw_top + h_off;
x2 = room_width;
y2 = room_height;

u_off = x1 + background_x + x_offset;
v_off = y1 + background_y + y_offset;


u_min = u_off;
v_min = v_off;

u_max = u_off + (x2 - x1)*scale;
v_max = v_off + (y2 - y1)*scale;

uv_scale = vector_create( (1/50)*scale , (1/50)*scale );

shader_set( sha_cloud );

	// set shader uniforms
shader_set_uniform_i( iteration_uniform, iterations );
shader_set_uniform_f_array( light_direction_uniform, light_direction );
shader_set_uniform_f_array( light_colour_uniform, light_colour );
shader_set_uniform_f_array( uv_scale_uniform, uv_scale );



draw_primitive_begin_texture( pr_trianglelist, sprite_get_texture( spr, 0 ) );


draw_vertex_texture_color( x1, y1, u_min, v_min, col, 1 );
draw_vertex_texture_color( x1, y2, u_min, v_max, col, 1 );
draw_vertex_texture_color( x2, y1, u_max, v_min, col, 1 );

draw_vertex_texture_color( x1, y2, u_min, v_max, col, 1 );
draw_vertex_texture_color( x2, y1, u_max, v_min, col, 1 );
draw_vertex_texture_color( x2, y2, u_max, v_max, col, 1 );


draw_primitive_end();
	
shader_reset();
	
surface_reset_target();
