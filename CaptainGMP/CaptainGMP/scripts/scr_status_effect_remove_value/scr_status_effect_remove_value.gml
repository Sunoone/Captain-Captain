/// @description scr_status_effect_reset_value( node, value )
/// @param node
/// @param value

// This script removes all status effects from a node that affect the given value

if( instance_exists(argument0) && argument1 >= 0 )
{
	with( argument0 )
	{
		for( var i = ds_grid_width( modification ); i > 0; i--)
		{
			if( modification[# i, 2] == argument1 )
				scr_status_effect_remove( argument0, i );
		}
	}
}

