/// @description scr_ability_fetch_type( id, type, ds_list, core, target_id )
/// @param id
/// @param type
/// @param ds_list
/// @param core
/// @param target_id

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
				{
					//check if the ability is valid
					if( scr_ability_excecute_script( 0, ability_script[|i], argument4, argument3 ) )
						ds_list_add( 
							argument2,																		// ds_list
							ability_graphic[|i],															// 0 - sprite
							ability_script[|i],																// 1 - script
							scr_ability_excecute_script( 1, ability_script[|i], argument4, argument3 ),		// 2 - cost
							ability_tooltip[|i],															// 3 - tooltip
							ability_priority[|i]															// 4 - priority
						);
				}
			}
		}
	}
}