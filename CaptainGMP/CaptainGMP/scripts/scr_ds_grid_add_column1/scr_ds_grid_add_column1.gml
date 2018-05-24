/// @description scr_ds_grid_add_column( ds_grid, parm0, parm1*, parm2*, .. )
/// @param ds_grid
/// @param parm0
/// @param parm1*
/// @param parm2*
/// @param ..

// this script adds a column to a ds grid with the given parameters
// max 15 parameters after the ds_grid

var g_w, g_h, grid;
grid = argument[0];
g_w = ds_grid_width(grid);
g_h = ds_grid_height(grid);


ds_grid_resize( grid, g_w + 1, g_h );

for( var i = 1; i < argument_count; i++ )
	grid[# g_w, i-1] = argument[i];