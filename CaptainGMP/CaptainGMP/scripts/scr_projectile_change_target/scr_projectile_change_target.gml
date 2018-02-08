/// @description scr_projectile_change_target( id, x, y )
/// @param id
/// @param x
/// @param y

// this script changes the direction of the given projectile to point towards it's target

var man = global.projectile_manager;

with(man)
{
	var i = ds_list_find_index( list_id, argument0 );
	if( i >= 0 )
	{
		list_dir[|i] = point_direction( list_x[|i], list_y[|i], argument1, argument2 );
	}
}