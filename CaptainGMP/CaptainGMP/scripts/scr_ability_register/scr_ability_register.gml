/// @description scr_ability_register( icon, script, type, active, tooltip )
/// @param icon
/// @param script
/// @param type
/// @param active
/// @param tooltip


// this script registers an ability within the ability framework for the object calling this script

ds_list_add( ability_graphic, argument0 );
ds_list_add( ability_script, argument1 );
ds_list_add( ability_type, argument2 );
ds_list_add( ability_active, argument3 );
ds_list_add( ability_tooltip, argument4 );

if( argument2 > 0 ) // register this object with core?
	register_abilities = true;

	// create an ability index
var index = get_timer();

ds_list_add( ability_index, index );
return index;