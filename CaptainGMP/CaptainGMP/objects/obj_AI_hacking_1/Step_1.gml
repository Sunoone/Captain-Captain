/// @description create target list

if( !instance_exists( core ) )
{
	instance_destroy();
	exit;
}

	// get hacking part list
if( ds_list_empty( hacking_target_list ) )
{
	if( instance_exists( target_ship ) && instance_exists( target_core ) )
	{	
		ds_list_copy( hacking_target_list, target_ship.hackable_parts_list );
		scr_ds_list_merge( hacking_target_list, target_core.software );
		ds_list_shuffle( hacking_target_list );
	}
}
