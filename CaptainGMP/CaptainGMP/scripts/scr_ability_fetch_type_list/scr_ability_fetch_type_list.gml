/// @description scr_ability_fetch_type_list( ds_list_ids, type, ds_list, core, target_id )
/// @param ds_list_ids
/// @param type
/// @param ds_list
/// @param core
/// @param target_id

// this script takes a ds_list of id's, fetches all abilities of the given type from the id's and loads all ability resources in the given ds_list
if( ds_exists( argument0, ds_type_list ) )
	for( var i = ds_list_size( argument0 ) -1; i >= 0; i-- )
		scr_ability_fetch_type( argument0[|i], argument1, argument2, argument3, argument4 );