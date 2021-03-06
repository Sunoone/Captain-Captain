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
		var l, s;
		l = array_length_2d( stat, argument3 );
		s = ds_grid_width( modification );
		
		for( var i = 2; i < max_int; i++ )
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
				
				break;
			}
			else
				i++;
		}
	}
}