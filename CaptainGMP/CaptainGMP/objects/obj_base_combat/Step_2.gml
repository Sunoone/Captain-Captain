/// @description Update


// Update Active
if( !instance_exists( core ) )
	active = false;

// inherent the system objects end steps ------------------------------------------------------------------------------------------------
event_inherited();

// CPU cost -----------------------------------------------------------------------------------------------------------------------------
if( instance_exists( parent ) && active )
{
		// base CPU cost
	if( instance_exists( core ) && type >= 0 && type <= 3 )
	{			
		core.cpu_budget += stat[var_cpu_cost,0];
	}
}

switch_active = active;