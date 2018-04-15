/// @description scr_status_effect_remove_value( node, value )
/// @param node
/// @param value

// This script removes all status effects from a node that affect a specific value

if( instance_exists(argument0) )
{
	with( argument0 )
	{
		var v, s;
			
		s = ds_grid_width( modification );
		v = argument1;
		
		for(  )
		
			
		if( w >= 0 )
		{
			stat[ w, modification[# i, 3] ] = 0;
			scr_status_effect_update( argument0, w );
		}
			
		if( i < s-1 )
			ds_grid_add_grid_region( modification, modification, i + 1, 0, s - 1, 4, i, 0 );
			
		ds_grid_resize( modification, s - 1, 5 );
	}
}

