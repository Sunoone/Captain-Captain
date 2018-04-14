/// @description scr_cost_node( node )
/// @param node

// This script returns the cost of having the specified node active

var cost = 0;

for( var i = ds_grid_width( argument0.modification ) - 1; i > 0; i-- )
{	
	if( argument1 == argument0.modification[# i, 0])
		cost += argument0.modification[# i, 1];
}

return cost;