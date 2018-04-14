/// @description scr_cost_status_effects( node, core )
/// @param node
/// @param core

// This script returns the cost of the status effects applied on the given node for the core object

var cost = 0;

for( var i = ds_grid_width( argument0.modification ) - 1; i > 0; i-- )
{	
	if( argument1 == argument0.modification[# i, 0])
		cost += argument0.modification[# i, 1];
}

return cost;