/// @description scr_camera_create( screen_index, x1*, y1*, x2*, y2* )
/// @param screen
/// @param x1*
/// @param y1*
/// @param x2*
/// @param y2*

// creates a camera object for the given screen

if( argument_count != 1 && argument_count != 5 ) show_error( "Script 'scr_camera_create' recieved an incorrect amount of arguments" , true)

var c = instance_create_depth(0,0,0,obj_camera);
c.screen_index = argument[0];

if( argument_count == 1 )
{
	var s = scr_screen_surface_get_id( argument[0] );

	c.x2 = surface_get_width( s );
	c.y2 = surface_get_height( s );
}
else
{
	c.x1 = argument[1];
	c.y1 = argument[2];
	c.x2 = argument[3];
	c.y2 = argument[4];
}

with(c)
{
	x = (x1 + x2) * 0.5;
	y = (y1 + y2) * 0.5;

	vx = (x2-x1) * 0.5;
	vy = (y2-y1) * 0.5;
}

return c;