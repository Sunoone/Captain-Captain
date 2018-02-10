/// @description scr_ds_list_max( id )

// this script returns the max number out of the ds_list
// returns 0 if there is no value to return

var m = 0;

var s = ds_list_size( argument0 );

if( s == 0 ) return( m );

m = argument0[|0];

for( var i = 1; i < s; i++ )
{
	if( is_real(argument0[|i]) )
	{
		m = max( m, argument0[|i] );
	}
}

return m;