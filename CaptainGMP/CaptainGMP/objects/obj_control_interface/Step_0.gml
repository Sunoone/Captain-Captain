/// @description update screen
// We draw the interface elements in a circulair interface here


// update interface screen
screen_id = scr_screen_surface_get_id( screen_index );


// Set the drawing target to the interface screen
surface_set_target( screen_id ); 


// get mouse position relative to the screen
var m_x, m_y;
m_x = scr_screen_mouse_get_x( screen_index );
m_y = scr_screen_mouse_get_y( screen_index );


// update selected element
if( instance_exists( global.interface_select_id[index] ) )
	global.interface_select_id[index].light_up = 0.1;


// update elements
scr_interface_update();

// draw base background
	// draw cicles
	draw_circle_color( s_width, s_height, rad_0, c_blue, c_blue, false );
	draw_circle_color( s_width, s_height, rad_0 - r_dist, c_aqua, c_aqua, false );
	draw_circle_color( s_width, s_height, rad_0 - r_dist*2, c_ltgray, c_ltgray, false );

	// draw core
	var owner_color = c_red;
	if( access == 1 ) owner_color = c_green;

	draw_circle_color( s_width, s_height, rad_0 - r_dist*3, owner_color, owner_color, false );


// draw seperation lines
scr_interface_draw_seperation_lines();


// draw links
scr_interface_draw_links();


// draw interface icons
scr_interface_draw_nodes();


// draw drag indication lines when draging an element
scr_interface_draw_indication_lines();


// reset the draw target
surface_reset_target();


// Draw inventory
scr_interface_draw_inventory();


// Draw menu
scr_interface_draw_menu();