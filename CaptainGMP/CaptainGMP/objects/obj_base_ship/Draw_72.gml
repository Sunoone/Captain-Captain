/// @description Combat Draw
// The draw code for ships

	// probably more efficient to keep a list with objects to draw

if( !surface_exists( object_surface ) ) 
	object_surface = surface_create( ( ship_grid_width + 1 ) * ship_grid_size, ( ship_grid_height ) * ship_grid_size ); // this is a hack, center of the surface needs to be bound to the center of the grid, surface needs to be calculated based on ship sprite


// Shield Surface ----------------------------------------------------------------------------------------------------------------------------------------------------------------
if( !surface_exists( Shield_surface ) )
	scr_shield_draw( SHAPE, shield_height );



// draw Ship
surface_set_target( object_surface );

draw_clear_alpha( c_black, 0 );

scr_ship_draw();

// reset the draw target
surface_reset_target();




// draw ship --------------------------------------------------------------
var h_width, h_height, l;

h_width = surface_get_width(object_surface) * 0.5 /*- ((ship_hallign + ship_hallign_off) * ship_grid_size)*/;
h_height = surface_get_height(object_surface) * 0.5 /*- ((ship_vallign + ship_vallign_off) * ship_grid_size)*/;

l = scr_point_rotate( h_width, h_height, direction );

scr_camera_draw_surface( global.combat_camera, object_surface, x + l[0], y + l[1], direction );




// Draw Shields ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if( !surface_exists( Shield_mask_surface ) )
{
	Shield_mask_surface = surface_create( surface_get_width( Shield_surface ) , surface_get_height( Shield_surface ) );
	surface_set_target(Shield_mask_surface);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
}

if( !surface_exists(Shield_drawing_surface) )
	Shield_drawing_surface = surface_create( surface_get_width( Shield_surface ) , surface_get_height( Shield_surface ) );




	// DEBUG draw masking surface
surface_set_target(Shield_mask_surface);
	
var c_x, c_y;
c_x = surface_get_width( Shield_mask_surface );
c_y = surface_get_height( Shield_mask_surface );

draw_primitive_begin( pr_trianglestrip );

draw_vertex_color( 0,0,c_white, 0.85 );
draw_vertex_color( c_x,0,c_white, 0.85 );
draw_vertex_color( 0,c_y,c_white, 0.85 );
draw_vertex_color( c_x,c_y,c_white, 0.85 );

draw_primitive_end();

	// hack for testing
//for( var i = 0; i < array_length_1d(SHAPE); i++ )
		//scr_bezier_draw( c_x, c_y, SHAPE[i], 10, c_white, c_white, 0.1, 0.85 );

surface_reset_target();



	
// Draw the Shield surface with the masking surface onto the drawing surface ------------------------------------------------------
surface_set_target(Shield_drawing_surface);
draw_clear_alpha(c_black,0);

	// Masking shader
shader_set(sha_mask);
var texture_scale = vec2( 1 / surface_get_width( Shield_mask_surface ), 1 / surface_get_height( Shield_mask_surface ));
shader_set_uniform_f_array( mask_shader_texture_scale_uniform, texture_scale );
texture_set_stage( mask_shader_base_sampler, surface_get_texture( Shield_mask_surface ) );

draw_surface(Shield_surface, 0,0);

shader_reset();
surface_reset_target();

	// Reset masking surface
surface_set_target(Shield_mask_surface);
draw_clear_alpha(c_white,0);
surface_reset_target();

// Draw masked shield
if( shield > 0 )
{
	l = scr_point_rotate( h_width, h_height, direction );
	
	//gpu_set_blendmode(bm_add);
	scr_camera_draw_surface( global.combat_camera, Shield_drawing_surface, x + l[0], y + l[0], direction );
	//gpu_set_blendmode(bm_normal);
}