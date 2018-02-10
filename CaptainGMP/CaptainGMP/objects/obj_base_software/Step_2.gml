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

// update security rating
security_rating = sqr( security_level ) * ( 1 + ( 0.5 / interface_width ) * ( ds_list_size(owned_childern) - ds_list_size(children) ) );

HP_max = 1000000000;
HP = 1000000000;