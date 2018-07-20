/// @description Background


if( surface_exists( background ) )
{
	var h_off = debug_height * debug_enabled;
	draw_surface_part_ext( background, draw_left, draw_top + h_off, room_width, room_height - h_off, 0, h_off, draw_scale, draw_scale, c_white, 1 );
}


