/// @description scr_interface_inventory_check( interface_index, pos )
/// @param interface_index
/// @param pos

// this script checks if an interface element can be placed at the given location in the inventory of the interface

var int, pos;
int = global.owned_interface[ argument0 ];
pos = argument1;

if( pos < 0 || pos >= int.inventory_slots ) return false;

return ds_grid_get( int.inventory, pos, g_free );