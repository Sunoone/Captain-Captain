/// @description scr_buff_remove_provider( buff_origin, buff_target, index )
/// @param buff_origin
/// @param buff_target
/// @param index

// This script removes a buff from the provider list

if( instance_exists( argument0 ) && instance_exists( argument1 ) )
{
	with( argument0 )
	{
		var gw = ds_grid_width(buff_provider);
	
		for( var i = 1; i < gw; i++ )
		{
			if( buff_provider[# i, 0] == argument1 )
			{
				if( buff_provider[# i, 1] == argument2 )
				{
					buff_provider[# i, 0] =  0;
					buff_provider[# i, 1] = -1;
				
					exit;
				}
			}
		}
	}
}