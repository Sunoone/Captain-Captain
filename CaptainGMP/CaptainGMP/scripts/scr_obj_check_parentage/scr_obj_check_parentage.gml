/// @description scr_obj_check_parentage( id, object )
/// @param id
/// @param object

// this script checks if the given id is of the type object or has the object as one of it's parents
// not sure if this script is working properly

var index = argument0.object_index;

if( index == argument1 ) return true;

var parent = object_get_parent( index );

while( parent != -100 )
{
	if( parent == argument1 ) return true;
	index = parent;
	parent = object_get_parent( index );
}

return false;