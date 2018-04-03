/// @description scr_status_effect_update( node, index )
/// @param node
/// @param index

// This script updates the stats array under the given index

if( instance_exists(argument0) )
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