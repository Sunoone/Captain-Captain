/// @description Build part lists

if( owner < 0 )
	exit;

if( kickstart )
{
	if( instance_exists( core ) )
	{
		// scr_status_effect_add( id, core, 0, var_ability_0_active, 1 );
		kickstart = false;
	}
}

	// get the current part & software list
if( ds_list_empty(scan_list) )
{	
	scr_interface_get_ids( global.owned_interface[owner], scan_list );
}