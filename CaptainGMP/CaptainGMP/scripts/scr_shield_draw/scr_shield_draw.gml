/// @description scr_shield_draw( SHAPE, height )

/// @param SHAPE
/// @param height

// this script draws the shield based on the beziers in SHAPE
// only call this script from a obj_base_ship inherited object

Shield_surface = surface_create( surface_get_width( object_surface ) + shield_surface_size_increase, surface_get_height( object_surface ) + shield_surface_size_increase );
	
surface_set_target(Shield_surface);
draw_clear_alpha( c_white, 0 );
	
shader_set(sha_shield);

var c_x, c_y;
c_x = surface_get_width( Shield_surface ) * 0.5;
c_y = surface_get_height( Shield_surface ) * 0.5;

shader_set_uniform_f( shield_height_uniform, argument1 );
shader_set_uniform_f_array( shield_center_point_uniform, vec2( c_x, c_y ) );

	// Shape
for( var i = 0; i < array_length_1d(argument0); i++ )
	scr_bezier_draw( c_x, c_y, argument0[i], 10, c_black, c_white, 1, 1 );

shader_reset();

// DEBUG object surface border
draw_rectangle_color( 1,1,surface_get_width(Shield_surface)-2, surface_get_height(Shield_surface)-2, c_red,c_red,c_red,c_red,true );
draw_line_color( 0,surface_get_height(Shield_surface)*0.5,surface_get_width(Shield_surface),surface_get_height(Shield_surface)*0.5,c_red,c_red );
draw_line_color( surface_get_width(Shield_surface)*0.5,0,surface_get_width(Shield_surface)*0.5,surface_get_height(Shield_surface),c_red,c_red );


surface_reset_target();	