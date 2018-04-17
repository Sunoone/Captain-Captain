/// @description create target list

if( !instance_exists( core ) )
{
	instance_destroy();
	exit;
}

	// get hacking part list
if( ds_list_empty( defence_target_list ) && action_delay <= 0 )
{	
	var ship = scr_ship_from_owner( owner );
	
	if( instance_exists( ship ) && instance_exists( core ) )
	{	
		ds_list_copy( defence_target_list, ship.hackable_parts_list );
		scr_ds_list_merge( defence_target_list, core.software );
		ds_list_shuffle( defence_target_list );
	}
}
