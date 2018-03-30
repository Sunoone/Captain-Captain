/// @description scr_ability_create_structure( id )
/// @param id

// this script sets up the standart ability structure for the given object

with( argument0 )
{
	// create ds lists
	ability_graphic = ds_list_create();
	ability_active = ds_list_create();
	ability_type = ds_list_create();
	ability_script = ds_list_create();
	ability_tooltip = ds_list_create();
	ability_index = ds_list_create();
}