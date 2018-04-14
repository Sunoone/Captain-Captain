/// @description scr_object_apparent_owner_set( node, owner )
/// @param node
/// @param owner

// this script sets the apparent owner for all observers

var node = argument0;

for( var i = array_length_1d( node.apparent_owner ); i >= 0; i-- )
	node.apparent_owner[i] = argument1;