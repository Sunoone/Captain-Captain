/// @description Node Menu

scr_screen_surface_set_active( menu_screen_index, false );
draw_menu = false;

if( scr_screen_mouse_above(screen_index) )
	scr_interface_create_menu();