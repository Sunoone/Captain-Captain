/// @description scr_object_check_parentage( object, parent )
/// @param object
/// @param parent

// this script checks if the given object is of the type parent or has the object as one of it's parents

var index = argument0;

if( index == argument1 ) return true;

var parent = object_get_parent( index );

while( parent != -100 && parent != -1 )
{
	if( parent == argument1 ) return true;
	index = parent;
	parent = object_get_parent( index );
}

return false;