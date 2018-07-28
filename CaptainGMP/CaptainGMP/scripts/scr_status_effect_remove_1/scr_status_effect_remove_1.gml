/// @description scr_status_effect_remove_1( node, index )
/// @param node
/// @param index

// This script removes a status effect from a node
// Pass -1 in index to remove all status effects
/*
if( instance_exists(argument0) )
{
	with( argument0 )
	{
		if( argument1 < 0 ) // remove all modifications
		{
			var w;
			for( var i = ds_grid_width( modification ) -1; i > 0; i-- )
			{
				w = modification[# i, 2];
				
				if( w >= 0 )
				{
					stat[ w, modification[# i, 3] ] = 0;
					scr_status_effect_update( argument0, w );
				}
			}
			ds_grid_resize( modification, 1, 5 );
		}
		else
		{
			var i, s, w;
			
			s = ds_grid_width( modification );
			i = argument1;
			w = modification[# i, 2];
			
			if( w >= 0 )
			{
				stat[ w, modification[# i, 3] ] = 0;
				scr_status_effect_update( argument0, w );
			}
			
			scr_ds_grid_delete_column( modification, argument1 );
			
		}
	}
}