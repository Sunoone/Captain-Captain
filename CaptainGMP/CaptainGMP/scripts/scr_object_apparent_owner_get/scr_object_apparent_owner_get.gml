/// @description scr_object_apparent_owner_get( node, owner )
/// @param node
/// @param owner

// this script returns the apparent owner for the owner

var node, owner, w;

node = argument0;
owner = argument1;
w = array_length_1d( node.apparent_owner );

if( owner >= 0 )
{
	if( owner < w)
		return node.apparent_owner[owner];
	else for( var i = 0; i <= owner; i++ )
	{
		if( i >= w )
			node.apparent_owner[i] = -4;
	}
}
return -4;