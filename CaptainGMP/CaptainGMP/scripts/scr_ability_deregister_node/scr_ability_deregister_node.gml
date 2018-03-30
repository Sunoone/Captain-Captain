/// @description scr_ability_deregister_node( node, core )
/// @param node
/// @param core

// this script deregisters an ability with a node

if( instance_exists( argument0 ) && instance_exists( argument1 ))
{
	var own = argument1.owner;
	
	argument0.ability_running[ own, 0 ] = -4;
	argument0.ability_running[ own, 1 ] = -4;
	argument0.ability_running[ own, 2 ] = -4;
}