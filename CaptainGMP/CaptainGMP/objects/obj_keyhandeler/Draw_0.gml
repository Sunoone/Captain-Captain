/// @description Debug Draw

if( global.input_direction[0] )
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	
	draw_text_color( room_width - 10, room_height - 10, "Input Direction: " + string( global.input_direction[1] ), c_red, c_red, c_red, c_red, 1 );	
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
