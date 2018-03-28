/// @description scr_ability_register( icon, script, type, cpu, active, tooltip )
/// @param icon
/// @param script
/// @param type
/// @param cpu
/// @param active
/// @param tooltip


// this script registers an ability within the ability framework for the object calling this script

ds_list_add( ability_graphic, argument0 );
ds_list_add( ability_script, argument1 );
ds_list_add( ability_type, argument2 );	
ds_list_add( ability_cpu, argument3 );
ds_list_add( ability_active, argument4 );
ds_list_add( ability_tooltip, argument5 );


	// create an ability index
var index = get_timer();

ds_list_add( ability_index, index );
return index;