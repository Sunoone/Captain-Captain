/// @description DEBUG draw

var x1, y1;

x1 = screen_offset_x + x;
y1 = screen_offset_y + y;

draw_line_color( x1 - 10, y1 - 10, x1 + 10, y1 + 10, c_red, c_red );
draw_line_color( x1 + 10, y1 - 10, x1 - 10, y1 + 10, c_red, c_red );