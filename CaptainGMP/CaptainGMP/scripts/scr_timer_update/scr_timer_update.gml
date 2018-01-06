/// @description scr_timer_update()
// this script updates the delta timers and excecutes them in order

globalvar timer, DeltaTime;

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
	timer[# 1, i ] -= DeltaTime;
	
	if( timer[# 1, i ] <= 0 )
	{
		timer_move++;		
		if( timer[# 0, i ] >= 0 )
		{
			number = timer[# 3, i ];
			// execute timer
			with( timer[# 2, i ] )
			{
				event_user( number );
			}
			
			ds_grid_set_region( timer, 0, i, 3, i, -1 );
			
		}
	}
}

// move the grid up & shrink the grid
if( timer_move > 0 && timer_move != height)
{
	ds_grid_add_grid_region( timer, timer, 0, timer_move, 3, height - 1, 0, 0 );
	if( height > 25 )
	{
		var new_height = height - timer_move;
		if( new_height < 25 ) new_height = 25;
		
		ds_grid_resize(timer, 4, new_height );
	}
}