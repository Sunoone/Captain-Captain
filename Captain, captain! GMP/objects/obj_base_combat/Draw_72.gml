/// @description Combat Draw

// The standart draw code for combat objects

globalvar combat_screen;

if( surface_exists( object_surface ) )
{
	// fix rotation on center point
	var XX, YY, rotate_x, rotate_y, h_width, h_height, inherent_direction;
	
	//choose centerpoint based on surface dimentions
	//h_width = surface_get_width(object_surface) * 0.5;
	//h_height = surface_get_height(object_surface) * 0.5;
	
	//choose centerpoint based on sprite settings
	h_width = sprite_get_xoffset(sprite_index);
	h_height = sprite_get_yoffset(sprite_index);
	
	
	var len = sqrt( sqr(h_width) + sqr(h_height) );
	var dir = point_direction(0,0,h_width,h_height);
	
	inherent_direction = self_direction + direction;
	
	rotate_x = lengthdir_x(len, inherent_direction + dir);
	rotate_y = lengthdir_y(len, inherent_direction + dir);
	
	XX = x - h_width + (h_width - rotate_x);
	YY = y - h_height + (h_height - rotate_y);
	
	// draw surface with offset for rotation
	surface_set_target( combat_screen );
	draw_surface_ext( object_surface, XX, YY, 1, 1, inherent_direction, c_white, 1 );
	surface_reset_target();
}