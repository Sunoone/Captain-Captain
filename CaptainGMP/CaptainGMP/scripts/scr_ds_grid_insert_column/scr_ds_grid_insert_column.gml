/// @description scr_ds_grid_insert_column( ds_grid, width, value* )

/// @param ds_grid
/// @param width
/// @param value*

// this grid resizes the ds_grid, creating an empty column (value* or 0 if not given) at the given width

var width, height, value;
width = ds_grid_width( argument[0] );
height = ds_grid_height( argument[0] ) - 1;

if( argument_count>2 )
	value = argument[2];
else
	value = 0;

scr_ds_grid_add_column( argument[0] );

if( argument[1] != width ) 
	ds_grid_add_grid_region( argument[0], argument[0], argument[1], 0, width - 1, height, argument[1] + 1, 0 );

ds_grid_set_region( argument[0], argument[1], 0, argument[1], height, value );