/// @description scr_timer_add( id, sec, user_event )
/// @param id
/// @param sec
/// @param user_event

// This script adds a delta timer that triggers the user event of the given object

	// index
// [ 0, i ] = timer id, -1 if inactive
// [ 1, i ] = time in sec
// [ 2, i ] = object id
// [ 3, i ] = user event nr

globalvar timer;

var height = ds_grid_height( timer );
var i = ds_grid_value_y( timer, 0, 0, 0, height - 1, -1 );

if( i >= 0 ) if( timer[# 0, i] != -1 ) i = -1;

if( i == -1 )
{
	i = height;
	ds_grid_resize( timer, 4, height + 1 );
}

var timestamp = get_timer();

timer[# 0, i] = timestamp;
timer[# 1, i] = argument1;
timer[# 2, i] = argument0;
timer[# 3, i] = argument2;

return timestamp;