/// @description scr_core_connected( object_id )
/// @param object_id

// This script returns true if the given object_id is linked (interface) to it's core

var c = argument0.core;

	// does the object have a core specified?
if( instance_exists( c ) == false ) return false; 

var own = argument0.apparent_owner[ argument0.original_owner ];

	// does the specified core have the same owner as the object?
if( own != c.owner ) return false;

	// is the object linked to the core via it's roots
var r = argument0.root;

for( var i = argument0.type; i>0; i-- )
{
	if( !instance_exists( r ) )
		return false;
	
	r = r.root;
}

if( r == c )
	return true;
	
return false;