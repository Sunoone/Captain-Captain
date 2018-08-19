/// @description scr_buff_ini()

// this script loads the standart buffs into global.data

// buff type is castable on:
	// 0 = friedly nodes only
	// 1 = enemy nodes only
	// 2 = both

with( global.data )
{
		// Thrusters
	scr_buff_load( "Boost", "Boost", 6, obj_base_truster_component, 0 );
	
		// Hacking Defence
	scr_buff_load( "Raise Security Level", "Raise Security Level", 20, obj_base_combat, 0 );
	
		// Abilities
	scr_buff_load( "Ability 0 Active", "Ability 0 Active", -1, obj_base_combat, 0 );
	scr_buff_load( "Ability 1 Active", "Ability 1 Active", -1, obj_base_combat, 0 );
	scr_buff_load( "Ability 2 Active", "Ability 2 Active", -1, obj_base_combat, 0 );
	scr_buff_load( "Ability 3 Active", "Ability 3 Active", -1, obj_base_combat, 0 );
}