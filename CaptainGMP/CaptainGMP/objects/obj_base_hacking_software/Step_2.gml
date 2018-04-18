/// @description Subtract Extra cost

// Inherit the parent event
event_inherited();

	// Extra CPU cost
if( instance_exists( core ) && active && stat[var_ability_0_active,0] > 0 && scan_current[0] == false )
{			
	core.cpu_budget += CPU_reserve;
}

