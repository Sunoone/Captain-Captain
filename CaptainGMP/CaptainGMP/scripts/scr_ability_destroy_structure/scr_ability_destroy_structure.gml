/// @description scr_ability_destroy_structure( id )
/// @param id

// this script deregisters abilities and destroys the ability structure

with( argument0 )
{
	for( var i = ds_list_size( ability_type ); i <= 0; i-- )
	{
		if( ability_type[|i] == 1 )
		{
			// deregister with core	
			
		}
	}
	
	// destroy ds_lists
	ds_list_destroy( ability_graphic );
	ds_list_destroy( ability_type );	
	ds_list_destroy( ability_active );
	ds_list_destroy( ability_script );
	ds_list_destroy( ability_tooltip );
	ds_list_destroy( ability_index );
}