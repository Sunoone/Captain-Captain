/// @description scr_screen_mouse_get_y( screen_index )
/// @param screen_index

// this script returns the mouse y corrected for the screen y

return ( mouse_y - scr_screen_surface_get_y( argument0 ) );