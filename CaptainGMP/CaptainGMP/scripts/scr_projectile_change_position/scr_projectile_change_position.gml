/// @description scr_projectile_change_position( id, x, y )
/// @param id
/// @param dir

// this script changes the position of the given projectile

var man = global.projectile_manager;

with(man)
{
	var i = ds_list_find_index( list_id, argument0 );
	if( i >= 0 )
	{
		list_x[|i] = argument1;
		list_y[|i] = argument2;
	}
}