/// @description scr_interface_inventory_remove( interface_index, pos )
/// @param interface_index
/// @param pos


// this script removes the element from the given interface inventory

var int, pos, inv;

int = global.owned_interface[ argument0 ];	// interface id referance
pos = argument1;	// position on the ring

inv = int.inventory;

if( pos < 0 || pos >= int.inventory_slots ) show_error( "Script 'scr_interface_inventory_remove' recieved an invalid pos argument", true );

// declare vars
inv[# pos, e_id ] = -4;
inv[# pos, e_spr ] = -4;
inv[# pos, e_x ] = -4;
inv[# pos, e_y ] = -4;

inv[# pos, g_free ] = true;