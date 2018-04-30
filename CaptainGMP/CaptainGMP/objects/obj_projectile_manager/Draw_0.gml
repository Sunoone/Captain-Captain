/// @description draw projectiles

var combat_screen = global.combat_screen;

if( surface_exists( combat_screen ) )
{
	
	surface_set_target(combat_screen);
	
	var size, time, frame, camera;
	
	size = ds_list_size( projectile[0] );
	time = get_timer() * timerate_animation_speed;
	camera = global.combat_camera;
	
	for( var i = 0; i < size; i++ )
	{
		switch( list_type[|i] )
		{
			case 0: // normal projectile
			{
				if( list_ttl[|i] < 0 )
				{
					frame = floor( abs( list_ttl[|i] * animation_speed) mod sprite_get_number( list_imp[|i] ) );
					//draw_sprite_ext( list_imp[|i], frame, list_x[|i], list_y[|i], 1, 1, list_dir[|i], c_white, 1 );
					scr_camera_draw_sprite( camera, list_imp[|i], frame, list_x[|i], list_y[|i], list_dir[|i]);
				}
				else
				{
					frame = floor( (list_id[|i] + time) mod sprite_get_number( list_spr[|i] ) );
					//draw_sprite_ext( list_spr[|i], frame, list_x[|i], list_y[|i], 1, 1, list_dir[|i], c_white, 1 );
					scr_camera_draw_sprite( camera, list_spr[|i], frame, list_x[|i], list_y[|i], list_dir[|i]);
				}
			}
			break;	
			
			case 1:	// beam
			{
				var x1, y1, x2, y2;
				x1 = list_x[|i];
				y1 = list_y[|i];
				x2 = x1 + lengthdir_x( list_speed[|i], list_dir[|i] );
				y2 = y1 + lengthdir_y( list_speed[|i], list_dir[|i] );
				
				draw_line_width_color( x1, y1, x2, y2, 3, c_blue,c_blue );
				draw_line_color( x1, y1, x2, y2, c_white,c_white );
			}
			
			case 2: // missile
			{				
				var p_dir = point_direction( 0,0, list_v0[| i ], list_v1[| i ] );
				
				if( list_ttl[|i] < 0 )
				{
					frame = floor( abs( list_ttl[|i] * animation_speed) mod sprite_get_number( list_imp[|i] ) );
					//draw_sprite_ext( list_imp[|i], frame, list_x[|i], list_y[|i], 1, 1, p_dir, c_white, 1 );
					scr_camera_draw_sprite( camera, list_imp[|i], frame, list_x[|i], list_y[|i], list_dir[|i]);
				}
				else
				{
					frame = floor( (list_id[|i] + time) mod sprite_get_number( list_spr[|i] ) );
					//draw_sprite_ext( list_spr[|i], frame, list_x[|i], list_y[|i], 1, 1, p_dir, c_white, 1 );
					scr_camera_draw_sprite( camera, list_spr[|i], frame, list_x[|i], list_y[|i], list_dir[|i]);
				}
			}
			break;	
			
			default:
			break;
		}
		
		
	}

	surface_reset_target();

}
