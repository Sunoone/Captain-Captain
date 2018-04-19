/// @description scr_AI_get_part_list( owner, ds_list )
/// @param owner
/// @param ds_list

// this script gets all objects and software from the target owner

ds_list_clear( argument1 );

if( argument0 < 0 || argument0 >= array_length_1d( global.owner_core ) )
	exit;

var ship, core;

ship = scr_ship_from_owner( argument0 );
core = global.owner_core[ argument0 ];

if( instance_exists( ship ) && instance_exists( core ) )
{
	ds_list_copy( argument1, ship.hackable_parts_list );
	scr_ds_list_merge( argument1, core.software );
}