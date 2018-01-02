/// @description Look for nodes under mouse

// selecting a node
globalvar node, nodeSurface, node_surface_x, node_surface_y;

var s_width, s_height, mouse_x_s, mouse_y_s, dist;
s_width = surface_get_width(nodeSurface);
s_height = surface_get_height(nodeSurface);
mouse_x_s = mouse_x - node_surface_x;
mouse_y_s = mouse_y - node_surface_y;
dist = sprite_get_width(spr_baseNode) * 0.5;

if( mouse_x >= node_surface_x && 
	mouse_x < node_surface_x + s_width &&
	mouse_y >= node_surface_y && 
	mouse_y < node_surface_y + s_height )
{
	var l = array_height_2d(node);
	
	if( variable_instance_exists( selected, "node_active" ) ) selected.node_active = false;
	selected = -5;
	
	for(var i = 0; i<l; i++)
	{
		if( src_look_for_instance_radius( node[i,0], obj_baseNode, mouse_x_s, mouse_y_s, dist ) )
		{
			selected = node[i,0];
			selected.node_active = true;
			break;
		}
	}
}