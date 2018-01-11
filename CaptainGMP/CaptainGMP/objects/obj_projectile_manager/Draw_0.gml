/// @description draw projectiles

var combat_screen = global.combat_screen;

if( surface_exists( combat_screen ) )
{
	
	surface_set_target(combat_screen);
	
	var size, time, frame;
	
	size = ds_list_size( projectile[0] );
	time = get_timer() * timerate_animation_speed;
	
	for( var i = 0; i < size; i++ )
	{
		switch( list_type[|i] )
		{
			case 0: //normal projectile
				if( list_ttl[|i] < 0 )
				{
					frame = floor( abs( list_ttl[|i] * animation_speed) mod sprite_get_number( list_exp[|i] ) );
					draw_sprite_ext( list_exp[|i], frame, list_x[|i], list_y[|i], 1, 1, list_dir[|i], c_white, 1 );
				}
				else
				{
					frame = floor( (list_id[|i] + time) mod sprite_get_number( list_spr[|i] ) );
					draw_sprite_ext( list_spr[|i], frame, list_x[|i], list_y[|i], 1, 1, list_dir[|i], c_white, 1 );
				}
			break;	
			
			default:
			break;
		}
		
		
	}

	surface_reset_target();

}
