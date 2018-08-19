/// @description scr_status_effect_ini()

// this script loads the standart status effects into global.data
// for later mod support, these effects will be loaded from file

with( global.data )
{
		// hacking defence
	scr_status_effect_load( "Improved Firewalling", spr_action_antivirus, 5, var_security_level, 1, false, obj_base_combat, 0 );
	
		// turret
	scr_status_effect_load( "Aiming Assistance", spr_combat_regulator, 0, var_rotation_max, 0.5, true, obj_base_turret_component, 0 );
	
	
	// Buffs --------------------------------------------------------------------------------------------------------------------------------------------------
		
		// thrusters
	scr_status_effect_load( "Boost", spr_action_buff, 6, var_maxThrust, 1, true, obj_base_truster_component, 100 );
	
		// hacking security
	scr_status_effect_load( "Raise Security Level", spr_action_buff, 6, var_security_level, 2, false, obj_base_combat, 0 );
	
		// Abilities
	scr_status_effect_load( "Ability 0 Active", spr_action_buff, 6, var_ability_0_active, 1, false, obj_base_combat, 0 );
	scr_status_effect_load( "Ability 1 Active", spr_action_buff, 6, var_ability_1_active, 1, false, obj_base_combat, 0 );
	scr_status_effect_load( "Ability 2 Active", spr_action_buff, 6, var_ability_2_active, 1, false, obj_base_combat, 0 );
	scr_status_effect_load( "Ability 3 Active", spr_action_buff, 6, var_ability_3_active, 1, false, obj_base_combat, 0 );
}