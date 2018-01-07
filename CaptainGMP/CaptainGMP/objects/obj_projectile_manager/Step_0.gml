/// @description debug, proof of concept
// check collision line under mouse

var m_x,m_y;
m_x = scr_screen_mouse_get_x( global.combat_screen_index );
m_y = scr_screen_mouse_get_y( global.combat_screen_index );

debug_array = scr_check_collision_line( 4, m_x, m_y, m_x, m_y );