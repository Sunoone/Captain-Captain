/// @description Timer - reset animation
animation_count = 0;
animation_speed = 0;

surface_set_target( object_surface );
		
draw_clear_alpha(c_black, 0);
draw_sprite(sprite_index, round(animation_count) , sprite_get_xoffset(sprite_index), sprite_get_yoffset(sprite_index) );
		
surface_reset_target();