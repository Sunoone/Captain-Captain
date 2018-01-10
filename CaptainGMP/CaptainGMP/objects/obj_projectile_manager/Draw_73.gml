/// @description draw projectiles

var combat_screen = global.combat_screen;

if( surface_exists( combat_screen ) )
{
	
	surface_set_target(combat_screen);
	
	var size = ds_list_size( list_id );
	
	for( var i = 0; i < size; i++ )
	{
		draw_sprite_ext( list_spr[|i], 0, list_x[|i], list_y[|i], 1, 1, list_dir[|i], c_white, 1 );
	}

	surface_reset_target();

}
