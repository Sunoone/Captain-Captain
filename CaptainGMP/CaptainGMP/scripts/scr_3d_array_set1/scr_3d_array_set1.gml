/// @desciption scr_3d_array_set( id, x, y, z, value )
/// @param id
/// @param x
/// @param y
/// @param z
/// @param value

// this script sets a value from the given 3d array

with( global.data ) ds_grid_set( data_array[ argument0, argument3 ], argument1, argument2, argument4 );