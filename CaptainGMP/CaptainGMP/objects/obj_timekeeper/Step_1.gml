/// @description Track Time

// Update player Time Dilation
global.TimeDilation = 1;

var ship = -4;

for( var i = ds_list_size( global.registry ) -1; i >= 0; i-- )
{
	ship = global.registry[|i];
	
	if( instance_exists( ship ) )
	{
		if( ship.owner == global.player )
		{
			if( instance_exists( ship.ship_core ) )
			{
				var cpu = ship.ship_core.cpu_available;
				
				if( cpu < 0 ) cpu = 0;
				
				// this is probably not the right formula that we want to be using
				if( cpu > 0 )
					global.TimeDilation = 1 / power( cpu , 0.05 );
			}
		}
	}
}

// Update global.DeltaTime
global.DeltaTime = global.TimeDilation * delta_time * 0.000001; // Delta Time in sec

// Update the delta timers
scr_timer_update();