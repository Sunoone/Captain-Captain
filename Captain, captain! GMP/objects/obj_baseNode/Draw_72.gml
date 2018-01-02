/// @description Connections
// You can write your code in this editor

surface_set_target(nodeSurface);

var l = ds_list_size( connection )
for( var i = 0; i<l; i++ )
{
	var c = connection[|i];
	draw_line_width_color( x,y, c.x, c.y, 3, c_white, c_white );	
}

surface_reset_target();