/// @description Debug Draw

if( global.player == original_owner )
{
	draw_set_halign(fa_right);
	draw_text_color( room_width - 10, 10, "CPU: " + string( cpu_available ), c_red, c_red, c_red, c_red, 1 );
	draw_set_halign(fa_left);
}
