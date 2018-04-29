/// @description scr_camera_draw_surface( camera, surface_id,   )
/// @param surface_id




surface_set_target( scr_screen_surface_get_id( global.combat_screen_index ) );

var camera, surface_width, surface_height;

camera = global.combat_camera;

surface_width = 

draw_surface_ext( surface_id, x, y, xscale, y_scale, rot, colour, alpha );

surface_reset_target();