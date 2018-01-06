/// @description scr_timer_ini( )
// this script initialises the delta timer structure

globalvar timer;

timer = ds_grid_create( 4, 25 );
ds_grid_set_region( timer, 0, 0, 3, 24, -1 );

	// index
// [ 0, i ] = timer id, -1 if inactive
// [ 1, i ] = time in sec
// [ 2, i ] = object id
// [ 3, i ] = event nr