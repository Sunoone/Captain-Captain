/// @description scr_camera_get_mouse_x( camera )
/// @param camera

// this script returns the world position for the mouse_x

var c, ml, md, camera_screen_index, camera_screen_id, c_x, c_y;
	
c = argument0;
camera_screen_index = c.screen_index;
camera_screen_id = scr_screen_surface_get_id( camera_screen_index );

c_x = surface_get_width(camera_screen_id) * 0.5 + scr_screen_surface_get_x( camera_screen_index );
c_y = surface_get_height(camera_screen_id) * 0.5 + scr_screen_surface_get_y( camera_screen_index );

ml = point_distance( c_x, c_y, mouse_x, mouse_y ) * c.scale;
md = point_direction( c_x, c_y, mouse_x, mouse_y ) + c.rot;

return ( c.x + lengthdir_x( ml, md ) );