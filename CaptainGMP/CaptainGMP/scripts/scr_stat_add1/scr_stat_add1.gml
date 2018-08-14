/// @description scr_stat_add( object_id, stat_index, value, use_core_stat* )
/// @param object_id
/// @param stat_index
/// @param value
/// @param use_core_stat*

// this script adds a stat and returns the position

var corestat = false;
if(argument_count > 3 )
	corestat = argument[3];

with( argument[0] )
{
	switch( corestat )
	{
		case true:
		{
			var m, i;
			m = array_length_2d( core_stat, argument[1] );
			for( i = 2; i < m; i++ )
			{
				if( core_stat[ argument[1], i] == 0 )
				{
					break;
				}
			}
			core_stat[@  argument[1], i] = argument[2];
			scr_status_effect_update( argument[0], argument[1], true );
			return i;
		}
		break;
		
		default:
		{
			var m, i;
			m = array_length_2d( stat, argument[1] );
			for( i = 2; i < m; i++ )
			{
				if( stat[ argument[1], i] == 0 )
				{
					break;
				}
			}
			stat[@  argument[1], i] = argument[2];
			scr_status_effect_update( argument[0], argument[1] );
			return i;
		}
		break;
	}
}