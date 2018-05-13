/// @description scr_ds_grid_delete_column( ds_grid, pos )
/// @param ds_grid
/// @param pos

// this script deletes a column from the given ds_grid, and moves the data left and resizes the ds grid

var width, height;

width = ds_grid_width( argument0 );
height = ds_grid_height( argument0 );

// copy information
if( argument1 < width - 1 )
{
	ds_grid_set_grid_region( argument0, argument0, argument1 + 1, 0, width-1, height-1, argument1, 0 );
}

// resize grid
ds_grid_resize( argument0, width -1, height );