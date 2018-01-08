/// @desciption scr_3d_array_set( id, x1, y1, z1, x2, y2, z2, value )
/// @param id
/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/// @param value

// this script sets a value over a region in the given 3d array

var x_min = min( argument1, argument4 );
var x_max = max( argument1, argument4 );

var y_min = min( argument2, argument5 );
var y_max = max( argument2, argument5 );

var z_min = min( argument3, argument6 );
var z_max = max( argument3, argument6 );

with( global.data ) 
{
	for( var z = z_min; z < z_max + 1; z++  )
	{
		ds_grid_set_region( data_array[ argument0, z ], x_min, y_min, x_max, y_max, argument7 );
	}
}