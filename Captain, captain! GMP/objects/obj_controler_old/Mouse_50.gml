/// @description Draw Node Line
// You can write your code in this editor

globalvar node, nodeSurface, node_surface_x, node_surface_y;

if( instance_exists( selected ) )
{
	// are we drawing a line, so yes, continue
	
	if ( selected.object_index == obj_baseNode || object_get_parent(selected.object_index) == obj_baseNode )
	{
		surface_set_target(nodeSurface);
		draw_line_width_color( selected.x + node_surface_x, selected.y + node_surface_y, mouse_x, mouse_y, 3, c_yellow, c_yellow );
		surface_reset_target();
		
		node_line = true;
	}
	else {node_line = false;}
}
else {node_line = false;}