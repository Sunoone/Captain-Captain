/// @description scr_obj_check_parentage( id, parent )
/// @param id
/// @param parent

// this script checks if the given id is of the type parent or has the object as one of it's parents

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