/// @description scr_projectile_change_direction( id, dir )
/// @param id
/// @param dir

// this script changes the direction of the given projectile and calculates new vectors and speed

var man = global.projectile_manager;

with(man)
{
	var i = ds_list_find_index( list_id, argument0 );
	if( i >= 0 )
	{
		list_dir[|i] = argument1;
	
		var len = point_distance( 0,0,list_v0[|i],list_v1[|i] );
				
		list_v0[|i] = lengthdir_x( len, argument1 );
		list_v1[|i] = lengthdir_y( len, argument1 );
		
		// set speed
		if( list_type[|i] == 1 )
		{
			scr_beam_check_collision( i );
		}
		else
		{
			list_speed[|i] = len;
		}
	}
}