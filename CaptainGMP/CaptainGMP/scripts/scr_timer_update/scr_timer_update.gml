/// @description scr_timer_update()
// this script updates the delta timers and excecutes them in order

// fetch the globals
var timer, DeltaTime, timer_height;
timer = global.timer;
DeltaTime = global.DeltaTime;
timer_height = global.timer_height;

	// index
// [ 0, i ] = timer id, -1 if inactive
// [ 1, i ] = time in sec
// [ 2, i ] = object id
// [ 3, i ] = event nr

ds_grid_sort( timer, 1, true );

var height, timer_move, number;
height = ds_grid_height(timer);
timer_move = 0;

for( var i = 0; i < height; i++)
{
	timer[# 1, i ] -= DeltaTime; // time
	
	if( timer[# 1, i ] <= 0 ) // time
	{
		timer_move++;		
		if( timer[# 2, i ] > 0 ) // obj id
		{
			number = timer[# 3, i ];  // user event
			// execute timer
			with( timer[# 2, i ] ) // obj id
			{
				event_user( number );
			}
			
			ds_grid_set_region( timer, 0, i, 3, i, -1 );
			
		}
	}
}

// move the grid up & shrink the grid
if( timer_move > 0 )
{
	if( timer_move < height ) 
	{
		ds_grid_set_grid_region( timer, timer, 0, timer_move, 3, height - 1, 0, 0 );
		
		// savety set to -1 -> this can be optimised by not including data that will be discarded by the resize
		ds_grid_set_region( timer, 0, height - timer_move, 3, height - 1, -1 );
	}
	
	if( height > timer_height )
	{
		var new_height = height - timer_move;
		if( new_height < timer_height ) 
		{
			timer_move -= timer_height - new_height;
			new_height = timer_height;
		}
		
		ds_grid_resize(timer, 4, new_height );
	}
}