/// @description scr_ds_list_value_exist( id, value )
/// @param id
/// @param value


// this script loops trough an ds_list and returns wether or not the given value exists within it
var p = ds_list_find_index( argument0, argument1 );

if( p == -1 ) return false;

return true;
