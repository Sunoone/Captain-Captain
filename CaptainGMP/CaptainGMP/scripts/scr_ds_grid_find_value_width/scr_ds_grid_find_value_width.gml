/// @description scr_ds_grid_find_value_width( ds_grid, value, height )
/// @param ds_grid
/// @param value
/// @param height

// this script finds and returns the location (-1 for not found) of an value in the given grid

var w = ds_grid_width( argument0 );

for( var i = 0; i < w; i++ )
{
	if( argument0[# i, argument2 ] == argument1 ) return i;	
}
return -1;