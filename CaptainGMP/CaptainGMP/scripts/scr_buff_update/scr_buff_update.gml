/// @description scr_buff_update( node, index, use_core_stat )
/// @param node
/// @param index
/// @param use_core_stat

// This script updates the stats array under the given index

/*
if( instance_exists(argument0) )
{
	switch( argument2 )
	{
		case false:
		{
			with( argument0 )
			{
				var n = argument1;

				stat[n,0] = stat[n,1];
		
				var l = array_length_2d( stat, n )

				for( var j = 2; j < l; j++ )
				{
					stat[n,0] += stat[n,j];
				}
			}
		}
		break;
		
		case true:
		{
			if( scr_id_check_parentage(argument0, obj_base_core) )
			{
				with( argument0 )
				{
					var n = argument1;

					core_stat[n,0] = core_stat[n,1];
		
					var l = array_length_2d( core_stat, n )

					for( var j = 2; j < l; j++ )
					{
						core_stat[n,0] += core_stat[n,j];
					}
				}
			}
		}
		break;
	}
}