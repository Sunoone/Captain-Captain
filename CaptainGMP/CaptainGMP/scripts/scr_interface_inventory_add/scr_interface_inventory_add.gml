/// @description scr_interface_inventory_add( interface_index, id, pos )
/// @param interface_index
/// @param id
/// @param pos

// this script add an interface element to the given location in the inventory

var int, type, obj, pos;

int = global.owned_interface[ argument0 ];	// interface id referance
obj = argument1;	// object id
pos = argument2;	// position on the ring

if( scr_interface_inventory_check( argument0, pos ) == false ) return false;

var inv = int.inventory;

// clear lists in obj
ds_list_clear( obj.children );

// quarantine object
obj.quarantine = true;

// declare vars
inv[# pos, e_id ] = obj;
inv[# pos, e_spr ] = obj.sprite_index;
inv[# pos, e_x ] = 30;
inv[# pos, e_y ] = 30 + 60 * pos;

inv[# pos, g_free ] = false;

return true;