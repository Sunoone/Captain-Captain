/// @description create target list

if( !instance_exists( core ) )
{
	instance_destroy();
	exit;
}

	// get hacking part list
if( ds_list_empty( defence_target_list ) && action_delay <= 0 )
{
	scr_interface_get_ids( global.owned_interface[owner], defence_target_list );	
	ds_list_shuffle( defence_target_list );
}
