/// @desciption scr_3d_array_depth( id )
/// @param id

// this script returns the depth of the given 3d array
var c = 0;

with( global.data )
{
	var l = array_length_2d( data_array, argument0 );
	
	for( var z = 0; z < l; z++ )
	{
		if( ds_exists( data_array[ argument0, z ], ds_type_grid ) ) c++;
		else break;
	}
}

return c;