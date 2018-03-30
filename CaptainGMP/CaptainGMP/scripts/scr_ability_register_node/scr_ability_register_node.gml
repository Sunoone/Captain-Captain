/// @description scr_ability_register_node( node, core, index, icon )
/// @param node
/// @param core
/// @param index

// this script registers an ability with a node

if( instance_exists( argument0 ) && instance_exists( argument1 ))
{
	var own = argument1.owner;
	
	argument0.ability_running[ own, 0 ] = argument1;
	argument0.ability_running[ own, 1 ] = argument2;
	argument0.ability_running[ own, 2 ] = argument3;
}