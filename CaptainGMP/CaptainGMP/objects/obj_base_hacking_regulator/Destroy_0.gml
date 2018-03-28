// Inherit the parent event
event_inherited();

// Clean ds_lists
if( ds_exists( target_id, ds_type_list ) )
	ds_list_destroy( target_id );

ds_list_destroy( attack_id );
ds_list_destroy( defend_id );