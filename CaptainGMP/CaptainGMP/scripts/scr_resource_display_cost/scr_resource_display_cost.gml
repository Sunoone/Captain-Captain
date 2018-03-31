/// @description scr_resource_display_cost( core, cpu )
/// @param owner
/// @param cpu

// This script modifies the displayed cost

if( instance_exists( argument0 ) )
{
	if( argument0.owner == global.player )
	{
		global.resource_display.CPU_cost += argument1;	
	}
}