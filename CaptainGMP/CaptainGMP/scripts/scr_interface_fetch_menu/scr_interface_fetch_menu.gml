/// @description scr_interface_fetch_menu( ds_list, node, core, interface )
/// @param ds_list
/// @param node
/// @param core
/// @param interface

// This script fetches the menu options and places them in the given ds_list

var menu_options, node, core, interface, player_index, player_core, app_own;

menu_options = argument0;
node = argument1;
core = argument2;
interface = argument3;

player_index = global.player;
player_core = global.player_core;

app_own = scr_object_apparent_owner_get( node, player_index );

// clear the ds_list
ds_list_clear( menu_options );

	
switch( interface.access )
{
	case 0: // Hostile interface
	{
		// collect core hacking abilities
		if( node.secret_owner == player_index )
		{
			scr_ability_fetch_type_list( player_core.core_ability_id, 3, menu_options, player_core, node );
				
			// collect node abilities
			if( node.owner == player_index )
			{
				scr_ability_fetch_type( node, 0, menu_options, player_core, node );
			}
		}
		else
		{
			// collect basic hacking option
			scr_ability_fetch_type_list( player_core.core_ability_id, 1, menu_options, player_core, node );
		}
	}
	break;
	
	case 1: // Friendly interface
	{
			// collect core type 2 abilities
			scr_ability_fetch_type_list( core.core_ability_id, 2, menu_options, core, node );
				
			// collect node abilities
			scr_ability_fetch_type( node, 0, menu_options, core, node );
				
			if( app_own != player_index )
			{
				// collect antivirus tools
				scr_ability_fetch_type_list( core.core_ability_id, 4, menu_options, core, node );
			}
	}
	break;
}