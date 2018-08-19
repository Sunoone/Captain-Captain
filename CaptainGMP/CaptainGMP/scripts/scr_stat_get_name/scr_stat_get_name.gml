/// @description scr_stat_get_name( index )
/// @param index

// this script returns the name for the given stat


switch( argument0 )
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
		return "Ability 0 Active";
			
	case var_ability_1_active:
		return "Ability 1 Active";
			
	case var_ability_2_active:
		return "Ability 2 Active";
			
	case var_ability_3_active:
		return "Ability 3 Active";
			
	case var_maxThrust:
		return "Max Thrust";
			
	case var_mass:
		return "Mass";
			
	case var_drag:
		return "Drag";
			
	case var_rotation_max:
		return "Turret Rotation";
		
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