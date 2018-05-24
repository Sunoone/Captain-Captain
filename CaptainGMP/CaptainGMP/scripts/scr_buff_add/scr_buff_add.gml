/// @description scr_buff_add( node, origin, time, use_core_stat, index, value, icon )
/// @param node
/// @param origin
/// @param time
/// @param use_core_stat
/// @param index
/// @param value
/// @param icon

// This script adds a buff to a node
// pass a value of < 0 for inf duration buff

if( instance_exists(argument0) && instance_exists(argument1) )
{
	if( argument0.owner != argument1.owner )
		return -4;
	
	var s;
	
	switch( argument3 ) // do we use core_stats (true) or stats (false)
	{
		case false:
		{
			with( argument0 )
			{
				var l = array_length_2d( stat, argument4 );
			
				for( var i = 2; i < max_int; i++ ) // max_int is literaly the max value that an interger can take in GM
				{
					if( i >= l ) stat[argument4,i] = 0;
			
					if( stat[argument4,i] == 0 )
					{
						// Add the value to the stats array
						stat[argument4,i] = argument5;
		
						s = ds_grid_width( buff );
		
						ds_grid_resize( buff, s + 1, 7 );
			
						buff[# s, 0] = argument1;	// origin
						buff[# s, 1] = argument2;	// time
						buff[# s, 2] = argument3;	// core bool
						buff[# s, 3] = argument4;	// w
						buff[# s, 4] = i;			// h
						buff[# s, 5] = argument5;	// value
						buff[# s, 6] = argument6;	// icon
				
						scr_buff_update( argument0, argument4, argument3 );
						
						break;
					}
				}
			}
		}
		break;
		
		case true:
		{
			if( scr_id_check_parentage( argument0, obj_base_core ) )
			{
				with( argument0 )
				{
					var l = array_length_2d( core_stat, argument4 );
			
					for( var i = 2; i < max_int; i++ ) // max_int is literaly the max value that an interger can take in GM
					{
						if( i >= l ) core_stat[argument4,i] = 0;
					
						if( core_stat[argument4,i] == 0 )
						{
							// Add the value to the stats array
							core_stat[argument4,i] = argument5;
		
							s = ds_grid_width( buff );
		
							ds_grid_resize( buff, s + 1, 7 );
			
							buff[# s, 0] = argument1;	// origin
							buff[# s, 1] = argument2;	// time
							buff[# s, 2] = argument3;	// core bool
							buff[# s, 3] = argument4;	// w / index
							buff[# s, 4] = i;			// h
							buff[# s, 5] = argument5;	// value
							buff[# s, 6] = argument6;	// icon
				
							scr_buff_update( argument0, argument4, argument3 );
							
							break;
						}
					}
				}
			}
		}
		break;
	}
	
	with( argument1 )
	{
		var g_w, p;
		
		g_w = ds_grid_width( buff_provider );
		p = -1;
		
		for( var i = 1; i < g_w; i++ )
		{
			if( buff_provider[# i, 0] == 0 )
			{
				p = i;
				exit;
			}
		}
		
		if( p == -1 )
		{
			ds_grid_resize( buff_provider, g_w + 1, 2 );
			p = g_w;
		}
		
		buff_provider[# p, 0] = argument0;	// target node
		buff_provider[# p, 1] = s;			// buff index
	}
	
	return s;
}

return -4;