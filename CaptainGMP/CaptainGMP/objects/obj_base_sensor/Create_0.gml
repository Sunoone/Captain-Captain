/// @description Ini vars

// Inherit the parent event
event_inherited();

type = 2; // set type of object
name = "Base Sensor Component";

/*
if( instance_exists(core) )
	scr_buff_add( core, id, -1, true, var_core_camera_mode, 1, spr_sensor_1 );