/// @description scr_ability_deregister( ability_index )
/// @param ability_index

// this script deregisters an ability within the ability framework for the object calling this script

var i = ds_list_find_index( ability_index, argument0 );

if( i >= 0 )
{
	ds_list_delete( ability_graphic, i );
	ds_list_delete( ability_script, i );
	ds_list_delete( ability_type, i );
	ds_list_delete( ability_active, i );
	ds_list_delete( ability_tooltip, i );
	ds_list_delete( ability_index, i );
}