/// @description scr_status_effect_add( node, core, cost, index, value )
/// @param node
/// @param core
/// @param cost
/// @param index
/// @param value

// This script adds an status effect to a node

if( instance_exists(argument0) && instance_exists(argument1) )
{
	with( argument0 )
	{
		var s = ds_grid_width( modification );
		
		if( argument3 < 0 )
		{
			ds_grid_resize( modification, s + 1, 5 );
			
			modification[# s, 0] = argument1;	// core
			modification[# s, 1] = argument2;	// cost
			modification[# s, 2] = -4;	// w
			modification[# s, 3] = -4;	// h
		}
		else 
		{
			var l = array_length_2d( stat, argument3 );
			
			for( var i = 2; i < max_int; i++ ) // max_int is literaly the max value that an interger can take in GM
			{
				if( i >= l ) stat[argument3,i] = 0;
			
				if( stat[argument3,i] == 0 )
				{
					// Add the value to the stats array
					stat[argument3,i] = argument4;
				
					// Add modification data
					ds_grid_resize( modification, s + 1, 5 );
				
					modification[# s, 0] = argument1;	// core
					modification[# s, 1] = argument2;	// cost
					modification[# s, 2] = argument3;	// w
					modification[# s, 3] = i;			// h
				
					scr_status_effect_update( argument0, argument3 );
				
					return s;
				}
				else
					i++;
			}
		}
	}
}