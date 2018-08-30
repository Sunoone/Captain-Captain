/// @description DEBUG draw

if( owner == global.player )
{
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

	draw_text_color( 10, 50, "S: " + string( shield ), dc,dc,dc,dc,1 );
}