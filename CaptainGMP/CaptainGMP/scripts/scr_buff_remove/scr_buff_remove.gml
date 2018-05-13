/// @description scr_buff_remove( node, index )
/// @param node
/// @param index

// This script removes a buff from a node
// Pass -1 in index to remove all buffs

if( instance_exists(argument0) )
{
	with( argument0 )
	{
		if( argument1 < 0 ) // remove all buffs
		{
			var w;
			for( var i = ds_grid_width( buff ) -1; i > 0; i-- )
			{
				w = buff[# i, 3]; // index
				
				if( w >= 0 )
				{
					// remove from buff provider
					scr_buff_remove_provider( buff[# i, 0], argument0, i );
					
					// remove buff
					if( buff[# i, 2] )
					{
						core_stat[ w, buff[# i, 4] ] = 0;
						scr_buff_update( argument0, w, true );
					}
					else
					{
						stat[ w, buff[# i, 4] ] = 0;
						scr_buff_update( argument0, w, false );
					}
				}
			}
			ds_grid_resize( buff, 1, 7 );
		}
		else
		{
			var i, s, w;
			
			s = ds_grid_width( buff );
			i = argument1;
			w = buff[# i, 3];
			
			if( w >= 0 )
			{
				// remove from buff provider
				scr_buff_remove_provider( buff[# i, 0], argument0, i );
				
				// remove buff
				if( buff[# i, 2] )
				{
					core_stat[ w, buff[# i, 4] ] = 0;
					scr_buff_update( argument0, w, true );
				}
				else
				{
					stat[ w, buff[# i, 4] ] = 0;
					scr_buff_update( argument0, w, false );
				}
			}
			
			scr_ds_grid_delete_column( buff, argument1 );
			/*
			if( i < s-1 )
				ds_grid_set_grid_region( buff, buff, i + 1, 0, s - 1, 6, i, 0 );
			
			ds_grid_resize( buff, s - 1, 7 );
			*/
		}
	}
}