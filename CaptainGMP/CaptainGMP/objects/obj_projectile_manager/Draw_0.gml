/// @description Debug Draw

if( debug_array != -1 )
{
	if( instance_exists(debug_array) )
	{
		draw_text_color( 10,30, debug_array.name, c_red, c_red, c_red, c_red, 1 );	
	}
}
else
{
	draw_text_color( 10,30, "No Object Detected", c_red, c_red, c_red, c_red, 1 );
}