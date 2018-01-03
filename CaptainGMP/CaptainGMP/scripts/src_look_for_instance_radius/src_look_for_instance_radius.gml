/// @ description src_look_for_instance_radius( id, obj, x, y, rad )

// This screen returns if the given id is of the type obj, a decendant of obj and if x,y is within the radius of the id

globalvar node, nodeSurface, node_surface_x, node_surface_y;

var a_id = argument0;
var a_obj = argument1;
var a_x = argument2;
var a_y = argument3;
var a_rad = abs(argument4);

if( !instance_exists( a_id ) ) return false;
if( !object_exists( a_obj ) ) return false;

if ( a_id.object_index == a_obj || object_get_parent(a_id.object_index) == a_obj )
{
	if( point_distance( a_id.x, a_id.y, a_x, a_y ) <= a_rad ) return true;
}
return false;