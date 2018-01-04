/// @description scr_get_screen_mouse_x( screen_index )
// this script returns the mouse x corrected for the screen x

return ( mouse_x - scr_screen_surface_get_x( argument0 ) );