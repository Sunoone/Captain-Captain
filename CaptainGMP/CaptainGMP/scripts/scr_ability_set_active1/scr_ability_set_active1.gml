/// @description scr_ability_set_active( ability_index, active )
/// @param ability_index
/// @param active


// this script sets the ability with the given index to the given active state

var i = ds_list_find_index( ability_index, argument0 );

if( i >= 0 )
{
	ds_list_set( ability_active, i, argument1 )
}