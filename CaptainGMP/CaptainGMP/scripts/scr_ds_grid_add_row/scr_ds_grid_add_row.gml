/// @description scr_ds_grid_add_row( ds_grid, parm0, parm1*, parm2*, .. )
/// @param ds_grid
/// @param parm0
/// @param parm1*
/// @param parm2*
/// @param ..

// this script adds a row to a ds grid with the given parameters
// max 15 parameters after the ds_grid

var g_w, g_h, grid;
grid = argument[0];
g_w = ds_grid_width(grid);
g_h = ds_grid_height(grid);


ds_grid_resize( grid, g_w, g_h+1 );

for( var i = 1; i < argument_count; i++ )
	grid[# i-1, g_h] = argument[i];