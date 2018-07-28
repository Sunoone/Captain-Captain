/// @description scr_status_effect_update( node, index, use_core_stat* )
/// @param node
/// @param index
/// @param use_core_stat*

// This script updates the stats array under the given index

var corestat = false;
if(argument_count > 2 )
	corestat = argument[2];

if( instance_exists(argument[0]) )
{
	with( argument[0] )
	{
		switch( corestat )
		{
			case true:
			{
				var n = argument[1];

				core_stat[n,0] = core_stat[n,1];
		
				var l = array_length_2d( core_stat, n )

				for( var j = 2; j < l; j++ )
				{
					core_stat[n,0] += core_stat[n,j];
				}
			}
			break;
		
			default:
			{
				var n = argument[1];

				stat[n,0] = stat[n,1];
		
				var l = array_length_2d( stat, n )

				for( var j = 2; j < l; j++ )
				{
					stat[n,0] += stat[n,j];
				}
			}
			break;
		}
	}
}