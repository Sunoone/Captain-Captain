/// @description create target list

if( !instance_exists( core ) )
{
	instance_destroy();
	exit;
}

	// get hacking part list
if( ds_list_empty( hacking_target_list ) )
{
	scr_interface_get_ids( global.owned_interface[player_owner], hacking_target_list );	
	ds_list_shuffle( hacking_target_list );
}
