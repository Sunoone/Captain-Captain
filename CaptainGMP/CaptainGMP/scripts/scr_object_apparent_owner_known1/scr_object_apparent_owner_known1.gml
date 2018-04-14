/// @description scr_object_apparent_owner_known()
/// @param node
/// @param owner

// this script returns if the apparent owner is known to the owner index

var node, owner, w;

node = argument0;
owner = argument1;

var w = array_length_1d( node.apparent_owner );

if( owner < w && owner >= 0)
{
	if( node.apparent_owner[owner] >= 0 )
		return true;
}
else
{
	for( var i = w; i <= owner; i++ )
		node.apparent_owner[i] = -4;
}

return false;