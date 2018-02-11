/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ds_list_destroy( target_id );
if( ds_exists( part_list, ds_type_list ) )
	ds_list_destroy( part_list );