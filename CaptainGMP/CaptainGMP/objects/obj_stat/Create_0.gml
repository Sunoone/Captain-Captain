/// @description Ini stats

// inherent the parent event
event_inherited();

	// stats
update_variables = true;

stat[var_HP, 1] = 100;					// current HP of object
stat[var_HP_max, 1] = 100;				// max HP of object 
stat[var_regen, 1] = 0.025;				// every sec, 2.5% hp is regained
stat[var_cpu_cost, 1] = 100;			// base cost of object
stat[var_security_level, 1] = 1;		// resistance to hacking
stat[var_maxThrust, 1] = 0;				// Max Trust
stat[var_mass, 1] = 100;				// Mass
stat[var_drag, 1] = 0;					// Drag for object
stat[var_ability_0_active, 1] = 0;		// object ability 0 active
stat[var_ability_1_active, 1] = 0;		// object ability 1 active
stat[var_ability_2_active, 1] = 0;		// object ability 2 active
stat[var_ability_3_active, 1] = 0;		// object ability 3 active
stat[var_rotation_max,1] = 0;			// max turret rotation speed

// stat percentages
for( var i = array_height_2d( stat ) -1; i>= 0; i-- )
{
	stat_p[i,0] = 1;
	stat_p[i,1] = 1;
}