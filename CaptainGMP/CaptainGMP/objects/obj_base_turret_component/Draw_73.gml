/// @description debug_draw

var off_scr_x = scr_screen_mouse_get_x( global.combat_screen_index );
var off_scr_y = scr_screen_mouse_get_y( global.combat_screen_index );

var len = 50;

var x1, x2, y1, y2;

x1 = x - off_scr_x;
y1 = y - off_scr_y;

x2 = x1 + lengthdir_x( len, direction );
y2 = y1 + lengthdir_y( len, direction );


draw_line_color(x1,y1,x2,y2, c_green, c_red);