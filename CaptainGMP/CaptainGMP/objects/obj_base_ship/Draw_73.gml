/// @description DEBUG draw


var dw = 500;
var dc = c_white;
var bc = c_black;

draw_rectangle_color( dw-10, 0, dw + 150, 160, bc,bc,bc,bc,false );

draw_text_color( dw, 10, "D: " + string( drag ), dc,dc,dc,dc,1 );
draw_text_color( dw, 30, "dD: " + string( d_dir ), dc,dc,dc,dc,1 );
draw_text_color( dw, 50, "mD: " + string( mod_dir ), dc,dc,dc,dc,1 );

draw_text_color( dw, 70, "mA: " + string( m_area ), dc,dc,dc,dc,1 );
draw_text_color( dw, 90, "A: " + string( area ), dc,dc,dc,dc,1 );

draw_text_color( dw, 110, "TD: " + string( torque_drag ), dc,dc,dc,dc,1 );
draw_text_color( dw, 130, "T: " + string( torque ), dc,dc,dc,dc,1 );
draw_text_color( dw, 150, "ATD: " + string( aero_torque_drag ), dc,dc,dc,dc,1 );





/*

var x1, y1, d;

x1 = screen_offset_x + x;
y1 = screen_offset_y + y;
d = 150;

draw_line_color( x1 - d, y1, x1 + d, y1, c_green, c_green );
draw_line_color( x1, y1 - d, x1, y1 + d, c_green, c_green );
/*
draw_text_color( x1 + d, y1 + d, string( inertia[0] ), c_red,c_red,c_red,c_red,1 );
draw_text_color( x1 + d, y1 + d + 20, string( inertia[1] ), c_red,c_red,c_red,c_red,1 );