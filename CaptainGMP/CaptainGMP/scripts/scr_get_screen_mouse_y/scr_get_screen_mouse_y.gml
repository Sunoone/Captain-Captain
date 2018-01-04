/// @description scr_get_screen_mouse_y( screen_index )
// this script returns the mouse y corrected for the screen y

return ( mouse_y - scr_screen_surface_get_y( argument0 ) );