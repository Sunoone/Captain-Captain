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
}