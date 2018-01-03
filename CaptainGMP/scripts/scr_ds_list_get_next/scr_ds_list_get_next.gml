/// @description scr_ds_list_get_next( id, pos )
/// @param id
/// @param pos

var size;

size = ds_list_size(argument0);

if( size < 1 ) return 0;
if( size == 1 ) return ds_list_find_value(argument0, 0);

var get = argument1 + 1;
if( get >= size ) get = 0;
if( get < 0 ) get = 0;

return ds_list_find_value(argument0, get);