/// @description scr_ability_fetch_priority( id, core, ds_list, type, type* )
/// @param id
/// @param core
/// @param ds_list
/// @param type
/// @param type*

// This script fetches the highest priority ability out of the given types and loads the ability resources in the given ds_list

var returnvar = false;

if( instance_exists( argument[0] ) ) // check if argument0 is a single id
{
	
		// load types in array
	var type_array, types, prio;
	
	types = argument_count - 3;
	prio = 0;
	
	for( var i = 3; i < argument_count; i++ )
		type_array[i - 3] = argument[i];
	
	
	
	with( argument[0] )
	{
		for( var i = ds_list_size( ability_type ); i>=0; i-- )
		{
			for( var j = 0; j < types; j++ )
			{
				// check if the ability has the right type and is active
				if( ability_type[|i] == type_array[j] && ability_active[|i] ) 
				{
					// Does the ability have an higher priority?
					if( ability_priority[|i] > prio )
					{
						//check if the ability is valid
						if( scr_ability_excecute_script( 0, ability_script[|i], argument[0], argument[1] ) )
						{
							ds_list_clear( argument[2] );
							
							ds_list_add( 
								argument[2], 
								ability_graphic[|i],
								ability_script[|i],
								scr_ability_excecute_script( 1, ability_script[|i], argument[0], argument[1] ),
								ability_tooltip[|i] 
							);
							
							returnvar = true;
						}
					}
				}
			}
		}
	}
}

return returnvar;