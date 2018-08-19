/// @description scr_buff_ini()

// this script loads the standart buffs into global.data

with( global.data )
{
		// Thrusters
	scr_buff_load( "Boost", "Boost", 6, obj_base_truster_component );
}