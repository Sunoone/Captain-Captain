/// @desciption scr_3d_array_resize( id, width, height, depth )
/// @param id
/// @param width
/// @param height
/// @param depth

// this script resizes the given 3d array

with( global.data )
{
	var d_old = array_length_2d( data_array, argument0 );
	
	// destroy excess depth grids
	if( argument3 - d_old < 0 )
	{
		for( var z = argument3; z >= d_old; z++ )
		{
			ds_grid_destroy( data_array[ argument0, z ] );
			data_array[ argument0, z ] = -1;
		}
	}
	
	var grid;
	for( var z = 0; z < argument3; z++ )
	{
		grid = data_array[ argument0, z ];
		if( ds_exists( grid, ds_type_grid ) )
		{
			ds_grid_resize( grid, argument1, argument2 )	
		}
		else
		{
			data_array[ argument0, z ] = ds_grid_create( argument1, argument2 );
		}
	}
}