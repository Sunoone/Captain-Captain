/// @description scr_ability_set_active( ability_index, cpu )
/// @param ability_index
/// @param cpu


// this script sets the ability with the given index to the given cpu value

var i = ds_list_find_index( ability_index, argument0 );

if( i >= 0 )
{
	ds_list_set( ability_cpu, i, argument1 )
}