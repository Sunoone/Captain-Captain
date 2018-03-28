/// @description scr_ability_fetch_type( id, type, ds_list )
/// @param id
/// @param type
/// @param ds_list

// This script fetches all abilities of the given type from the id and loads the ability resources in the given ds_list

if( instance_exists( argument0 ) ) // check if argument0 is a single id
{
	with( argument0 )
	{
		for( var i = ds_list_size( ability_type ); i>=0; i-- )
		{
			// check if the ability has the right type and is active
			if( ability_type[|i] == argument1 && ability_active[|i] ) 
			{
				// make sure to add only unique entries
				if( scr_ds_list_value_exist( argument2, ability_script[|i] ) == false ) 
					ds_list_add( 
						argument2, 
						ability_graphic[|i],
						ability_script[|i],
						ability_cpu[|i],
						ability_tooltip[|i] 
					);
			}
		}
	}
}