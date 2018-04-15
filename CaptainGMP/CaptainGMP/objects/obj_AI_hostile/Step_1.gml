/// @description 

if( !instance_exists( core ) )
{
	instance_destroy();
	exit;
}

if( owner == global.player )
	exit;

	// get hacking part list
if( ds_list_empty( hacking_target_list ) )
{
	scr_interface_get_ids( global.owned_interface[global.player], hacking_target_list );	
	ds_list_shuffle( hacking_target_list );
}
