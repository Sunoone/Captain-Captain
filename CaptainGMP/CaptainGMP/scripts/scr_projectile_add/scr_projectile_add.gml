/// @description scr_add_projectile( owner, type, x, y, v0, v1, dam, spr_pro, ttl, spr_end )
/// @param owner
/// @param type
/// @param x
/// @param y
/// @param v0
/// @param v1
/// @param dam
/// @param spr_pro
/// @param ttl
/// @param spr_end

var p_id;
p_id = get_timer();

with( global.projectile_manager )
{
	ds_list_add( list_own, argument0 ); 
	
	ds_list_add( list_id, p_id );
	ds_list_add( list_type, argument1);
	
	ds_list_add( list_x, argument2);
	ds_list_add( list_y, argument3);
	
	ds_list_add( list_v0, argument4 );
	ds_list_add( list_v1, argument5 );
	
	ds_list_add( list_dir, point_direction( 0, 0, argument4,argument5 ));
	ds_list_add( list_speed, point_distance( 0, 0, argument4,argument5 ));
	
	ds_list_add( list_dam, argument6);
	ds_list_add( list_spr, argument7);
	
	ds_list_add( list_exp, argument9);
	ds_list_add( list_des, false);
	
	ds_list_add( list_ttl, argument8);
	//ds_list_add( list_mod, );
}

return p_id; // return the id of the projectile