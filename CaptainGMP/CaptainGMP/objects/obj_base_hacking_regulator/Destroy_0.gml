// Inherit the parent event
event_inherited();

// Clean ds_lists
ds_list_destroy( target_id );

ds_list_destroy( attack_id );
ds_list_destroy( defend_id );