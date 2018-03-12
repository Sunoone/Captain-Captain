/// @description Debug Draw
// Draw fps

var col = c_green;
if( fps_real < 30 ) col = c_red;
else if( fps_real < 60 ) col = c_orange;

draw_text_color(10,10, string(fps_real), col, col, col, col, 1);

/*
draw_sprite( spr_radial_menu_base, 0, mouse_x, mouse_y );

var c, w, col, col_val;
c = 3;
col = c_black;
w = 5;
col_val = 0;

repeat(3)
{
	for( var i = 0; i < c; i++ )
	{
		var ang, l_x, l_y;
	
		ang = 90 + ( 360 / c ) * i;
		l_x = mouse_x + lengthdir_x( 64, ang );
		l_y = mouse_y + lengthdir_y( 64, ang );
	
		draw_line_width_color( mouse_x, mouse_y, l_x, l_y, w, col, col);
	}
	
	col_val += 127;
	col = make_color_rgb( col_val, col_val, col_val);
	w -= 2;
}