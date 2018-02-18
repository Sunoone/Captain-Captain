/// @description Update Children
// You can write your code in this editor

// remove destroyed children
var size;

size = ds_list_size(children)

if( size>0 )
{
	for( var i = 0; i<size; i++ )
	{
		if( instance_exists( children[|i] ) == false )
		{
			ds_list_delete(children, i);
			i--;
			size--;
		}
	}
}

// update owned childern
ds_list_clear( owned_childern );

ds_list_copy( owned_childern, children );

if( size>0 )
{
	for( var i = size - 1; i >= 0; i-- )
	{
		if( owned_childern[|i].owner != owner )
		{
			ds_list_delete( owned_childern, i );	
		}
	}
}

	// Hacking
var own_c, all_c;
own_c = ds_list_size(owned_childern);
all_c = ds_list_size(children);

	// update security rating
security_rating = sqr( security_level ) * ( 1 + ( 0.5 / interface_width ) * ( own_c - all_c ) );

	// update hackability
/*
if( all_c <= 0)
{
	can_be_hacked = true;
	has_been_revealed = true;
}
*/
if( own_c < all_c )
{
	can_be_hacked = true;
	for( var i = all_c; i >= 0; i-- )
		children[|i].can_be_hacked_parent = true;
}
else
{
	can_be_hacked = false;
	for( var i = all_c; i >= 0; i-- )
		children[|i].can_be_hacked_parent = false;
}

// HP Hack
HP_max = 1000000000;
HP = 1000000000;