/// @description scr_create_AI( core, AI )
/// @param core
/// @param AI

// This script binds an AI to a core

var AI = instance_create_depth( 0, 0, 100, argument1)

argument0.AI = AI;

AI.core = argument0;
AI.owner = argument0.owner;