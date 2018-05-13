/// @description Debug Draw
/*
if( thrust != 0 )
{
	var x1,y1,x2,y2, thr_dis;
	
	thr_dis = (thrust / stat[ var_maxThrust, 0]) * 100;
	
	x1 = x + screen_offset_x;
	y1 = y + screen_offset_y;
	
	x2 = x1 + lengthdir_x( thr_dis , direction );
	y2 = y1 + lengthdir_y( thr_dis , direction );
	
	draw_line_width_color( x1,y1,x2,y2, 5, DEBUG_colour, c_black );
	
	//draw_text_color( x2, y2, "Thrust: " + string( thrust ), c_red, c_red, c_red, c_red, 1 );
	//draw_text_color( x2, y2+15, "Direction: " + string( thrust_direction ), c_red, c_red, c_red, c_red, 1 );
	//draw_text_color( x2, y2, "Torque: " + string( torque ), c_red, c_red, c_red, c_red, 1 );
}