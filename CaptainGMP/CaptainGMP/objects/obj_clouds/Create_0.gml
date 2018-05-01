/// @description Ini vars

	// co-ordinates
b_width = room_width;
b_height = room_height;	
draw_top = 0;
draw_left = 0;

	// drawing surface
background = -4;
draw_scale = 1;
texture_page_size = 8192;

	// camera
camera = -4;

	// change surface position
background_x = random(4000);
background_y = random(4000);
	
x_offset_1 = 0;
y_offset_1 = 0;
x_offset_2 = 0;
y_offset_2 = 0;

mouse_pressed = false;
start_drag_x = 0;
start_drag_y = 0;

scale = 1;
camera_zoom = 1;

	// cloud movement
c_move = vector_create( 0, 0 );

	// Debug
debug_enabled = false;
debug_height = 0;

show_debug_overlay(debug_enabled);

d_x2 = b_width - 10;
d_y1 = debug_height + 10;
d_x1 = d_x2 - 100;
d_y2 = d_y1 + 100;

d_col1 = c_white;
d_col2 = c_black;
d_col3 = scr_kelvin2rgb( 4000 ); d_col3 = make_color_rgb( d_col3[0]*255,d_col3[1]*255,d_col3[2]*255 );
d_col4 = scr_kelvin2rgb( 8000 ); d_col4 = make_color_rgb( d_col4[0]*255,d_col4[1]*255,d_col4[2]*255 );
d_kelvin = 5500;

	// Shader uniforms
iterations = 6;
iteration_uniform = shader_get_uniform( sha_cloud, "iterations" );

light_direction[0] = 0.3;
light_direction[1] = 0.9;
light_direction[2] = 0.6;
light_direction_uniform = shader_get_uniform( sha_cloud, "light_direction" );

light_colour = scr_kelvin2rgb( d_kelvin );
light_colour_uniform = shader_get_uniform( sha_cloud, "light_colour" );

uv_scale = vector_create( (scale/50) , (scale/50) );
uv_scale_uniform = shader_get_uniform( sha_cloud, "uv_scale" );