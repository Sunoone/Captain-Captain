/// @description scr_stat_get_name( index, use_core_stat* )
/// @param index
/// @param use_core_stat*

// this script returns the name for the given stat

var corestat = false;
if( argument_count > 1 )
	corestat = argument[1];

if( !corestat )
{
	switch( argument[0] )
	{
		case var_HP:
			return "HP";
			
		case var_HP_max:
			return "Max HP";
			
		case var_regen:
			return "Regeneration";
			
		case var_cpu_cost:
			return "CPU";
			
		case var_security_level:
			return "Security Level";
			
		case var_ability_0_active:
			return "Ability 0 active";
			
		case var_ability_1_active:
			return "Ability 1 active";
			
		case var_ability_2_active:
			return "Ability 2 active";
			
		case var_ability_3_active:
			return "Ability 3 active";
			
		case var_maxThrust:
			return "Max Thrust";
			
		case var_mass:
			return "Mass";
			
		case var_drag:
			return "Drag";
			
		case var_rotation_max:
			return "Turret Rotation";
			
		default:
			return "Undefined";
	}
}
else // core_stat
{
	switch( argument[0] )
	{
		case var_core_cpu:
			return "CPU";
			
		case var_core_cpu_bonus:
			return "CPU Max";
			
		case var_core_cpu_budget:
			return "CPU Budget";
			
		case var_core_cpu_available:
			return "CPU Availiable";
			
		case var_core_sensor_range:
			return "Sensor Range";
			
		case var_core_hacking_level:
			return "Hacking Level";
			
		case var_core_scan_level:
			return "Scan Level";
		
		case var_core_camera_mode:
			return "Camera Control";
			
		default:
			return "Undefined";
	}
}