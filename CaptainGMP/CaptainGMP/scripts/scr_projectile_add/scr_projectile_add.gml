/// @description scr_add_projectile( owner, type, x, y, v0, v1, dam, ttl, spr_pro, spr_imp, spr_muzz, spr_trail, snd_amb, snd_imp )
/// @param owner
/// @param type
/// @param x
/// @param y
/// @param v0
/// @param v1
/// @param dam
/// @param ttl
/// @param spr_pro
/// @param spr_imp
/// @param spr_muzz
/// @param spr_trail
/// @param snd_amb
/// @param snd_imp


var p_id;
p_id = get_timer();

with( global.projectile_manager )
{
	// id, type and owner
	ds_list_add( list_id, p_id );
	ds_list_add( list_own, argument0 ); 
	ds_list_add( list_type, argument1);
	
	// x and y position
	ds_list_add( list_x, argument2);
	ds_list_add( list_y, argument3);
	
	// projectile vector
	ds_list_add( list_v0, argument4 );
	ds_list_add( list_v1, argument5 );
	
	// projectile direction and speed
	ds_list_add( list_dir, point_direction( 0, 0, argument4,argument5 ));
	ds_list_add( list_speed, point_distance( 0, 0, argument4,argument5 ));
	
	// projectile damage amount and time to live
	ds_list_add( list_dam, argument6);
	ds_list_add( list_ttl, argument7);
	ds_list_add( list_des, false);
	
	// projectile sprites
	ds_list_add( list_spr, argument8);
	ds_list_add( list_imp, argument9);
	ds_list_add( list_muzz, argument10);
	ds_list_add( list_trail, argument11);
	
	
	// projectile sounds
	ds_list_add( list_a_amb, argument12 );
	ds_list_add( list_a_imp, argument13 );
	
	// unused projectile lists
	//ds_list_add( list_mod, );
}

return p_id; // return the id of the projectile