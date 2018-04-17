/// @description Switch to Player 0

if( instance_exists( global.owner_core[0] ) )
{
	// Player
	global.player = 0;	// declares the player to be owner 0;

	for( var i = 0; i < array_length_1d( global.interface_select_id ); i++ )
	{
		global.interface_select_id[i] = -4;
	}
}