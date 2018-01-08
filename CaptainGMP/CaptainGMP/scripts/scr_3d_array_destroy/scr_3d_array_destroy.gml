/// @desciption scr_3d_array_destroy( id )
/// @param id

// this script destroys the given 3d array

with( global.data )
{
	var d = array_length_2d( data_array, argument0 );
	
	for( var z = 0; z < d; z++ )
	{	
		ds_grid_destroy( data_array[argument0, z] );
		data_array[argument0, z] = -1;
	}
	occupied[ argument0 ] = false;
}