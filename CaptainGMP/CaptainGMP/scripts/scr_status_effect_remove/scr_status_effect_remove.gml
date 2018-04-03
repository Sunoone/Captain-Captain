/// @description scr_status_effect_remove( node, index )
/// @param node
/// @param index

// This script removes an status effect from a node
// Pass -1 in index to remove all status effects

if( instance_exists(argument0) )
{
	with( argument0 )
	{
		if( argument1 < 0 ) // remove all modifications
		{
			var w;
			for( var i = ds_grid_width( modification ); i > 0; i-- )
			{
				w = modification[# i, 2];
				
				stat[ w, modification[# i, 3] ] = 0;
				scr_status_effect_update( argument0, w );
			}
			ds_grid_resize( modification, 1, 5 );
		}
		else
		{
			var i, s, w;
			
			s = ds_grid_width( modification );
			i = argument1;
			w = modification[# i, 2];
			
			stat[ w, modification[# i, 3] ] = 0;
			scr_status_effect_update( argument0, w );
			
			if( i < s-1 )
				ds_grid_add_grid_region( modification, modification, i + 1, 0, s - 1, 4, i, 0 );
			
			ds_grid_resize( modification, s - 1, 5 );
			
			
		}
	}
}

