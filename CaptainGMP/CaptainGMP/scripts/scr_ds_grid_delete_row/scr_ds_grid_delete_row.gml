/// @description scr_ds_grid_delete_row( ds_grid, pos )
/// @param ds_grid
/// @param pos

// this script deletes a row from the given ds_grid, and moves the data left and resizes the ds grid

var width, height;

width = ds_grid_width( argument0 );
height = ds_grid_height( argument0 );

// copy information
if( argument1 < height - 1 )
{
	ds_grid_add_grid_region( argument0, argument0, 0, argument1 + 1, width-1, height-1, 0, argument1 );
}

// resize grid
ds_grid_resize( argument0, width, height -1 );