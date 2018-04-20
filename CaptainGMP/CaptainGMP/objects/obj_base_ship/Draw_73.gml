/// @description DEBUG draw

/*
var x1, y1, d;

x1 = screen_offset_x + x;
y1 = screen_offset_y + y;
d = 150;

draw_line_color( x1 - d, y1 - d, x1 + d, y1 + d, c_red, c_red );
draw_line_color( x1 + d, y1 - d, x1 - d, y1 + d, c_red, c_red );

draw_text_color( x1 + d, y1 + d, string( inertia[0] ), c_red,c_red,c_red,c_red,1 );
draw_text_color( x1 + d, y1 + d + 20, string( inertia[1] ), c_red,c_red,c_red,c_red,1 );