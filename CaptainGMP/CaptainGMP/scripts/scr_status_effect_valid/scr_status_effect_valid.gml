/// @description scr_status_effect_valid( obj_out, obj_in, out_index )
/// @param obj_out
/// @param obj_in
/// @param out_index

// this script retuns if a status effect is valid on the obj_in

if( !instance_exists(argument0) || !instance_exists(argument1) )
	return false;

with( argument0 )
{
	var i = argument2;
	
	// owner check
	if( scr_object_apparent_owner_get( argument0, original_owner ) == scr_object_apparent_owner_get( argument1, original_owner ) )
	
	// id check
	if( scr_ds_grid_find_value_width( argument1.status_effect_in, status_effect_out[# i, 1], 1 ) == -1 )
	
	// filter check
	if( scr_id_check_parentage( argument1, status_effect_out[# i, 4] ) )
	{
		
		// target check
		var target = status_effect_out[# i, 0 ];
		switch( target )
		{
			case 0:	// childern
			{	
				for( var i = ds_list_size(owned_childern)-1; i>=0; i--)
					if( owned_childern[|i] == argument1 )
						return true;
			}
			break;
		
			case 1:	// core
				if( scr_core_connected( argument0 ) && core == argument1 )
					return true;
			break;
		
			case 2:	// global
			{
				// not implemented, reserved for global target
			}
			break;
			
			case 3:	// root
				if( root == argument1 )
					return true;
			break;
			
			default: // object
				if( target == argument1 )
					return true;
			break;
		}
	}
}

return false;