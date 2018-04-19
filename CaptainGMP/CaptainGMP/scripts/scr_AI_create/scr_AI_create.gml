/// @description scr_AI_create( core, AI, AI*, ... )
/// @param core
/// @param AI
/// @param AI*
/// @param ...

// This script creates and binds one or several AI to a core

var core = argument[0];

for( var i = 1; i < argument_count; i++ )
{
	var AI = instance_create_depth( 0, 0, 100, argument[i])

	core.AI[i-1] = AI;

	AI.core = core;
	AI.owner = core.owner;
}