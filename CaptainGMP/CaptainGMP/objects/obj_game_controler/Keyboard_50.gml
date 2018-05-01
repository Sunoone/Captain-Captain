/// @description Switch to Player 1

if( instance_exists( global.owner_core[0] ) )
{
	// Player
	global.player = 1;	// declares the player to be owner 1;
	global.combat_camera.focus = debug_ship_1;
	
	for( var i = 0; i < array_length_1d( global.interface_select_id ); i++ )
	{
		global.interface_select_id[i] = -4;
	}
}