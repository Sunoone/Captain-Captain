/// @description scr_timer_ini( )
// this script initialises the delta timer structure

globalvar timer, timer_height;

timer_height = 25; // the desired timer height for the timer grid, this variable needs to stike a balance between minimising ds_grid_resize and keeping unnessesairy grid spaces

timer = ds_grid_create( 4, timer_height );
ds_grid_set_region( timer, 0, 0, 3, 24, -1 );

	// index
// [ 0, i ] = timer id, -1 if inactive
// [ 1, i ] = time in sec
// [ 2, i ] = object id
// [ 3, i ] = event nr