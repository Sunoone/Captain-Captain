/// @description Combat Draw
// The draw code for ships

	// probably more efficient to keep a list with objects to draw

if( !surface_exists( object_surface ) ) 
	object_surface = surface_create( ( ship_grid_width + 1 ) * ship_grid_size, ( ship_grid_height ) * ship_grid_size ); // this is a hack, center of the surface needs to be bound to the center of the grid, surface needs to be calculated based on ship sprite


// Shield Surface ----------------------------------------------------------------------------------------------------------------------------------------------------------------
if( !surface_exists( Shield_surface ) )
{
	Shield_surface = surface_create( surface_get_width( object_surface ) + shield_surface_size_increase, surface_get_height( object_surface ) + shield_surface_size_increase );
	
	surface_set_target(Shield_surface);
	draw_clear_alpha( c_white, 0 );
	
	shader_set(sha_shield);
		
	var c_x, c_y;
	c_x = surface_get_width( Shield_surface ) * 0.5;
	c_y = surface_get_height( Shield_surface ) * 0.5;
	
	
	shader_set_uniform_f( shield_height_uniform, shield_height );
	shader_set_uniform_f_array( shield_center_point_uniform, vec2( c_x, c_y ) );
	shield_height = 30;

		// Shaders

	scr_bezier_draw( c_x, c_y, SB0, 10, c_black, c_white, 1, 1 );
	scr_bezier_draw( c_x, c_y, SB1, 10, c_black, c_white, 1, 1 );
	scr_bezier_draw( c_x, c_y, SB2, 10, c_black, c_white, 1, 1 );
	scr_bezier_draw( c_x, c_y, SB3, 10, c_black, c_white, 1, 1 );
	
	shader_reset();
	
	// DEBUG shield surface border
	//draw_rectangle_color( 1,1,surface_get_width(Shield_surface)-2, surface_get_height(Shield_surface)-2, c_red,c_red,c_red,c_red,true );

	surface_reset_target();	
}



// draw Ship
surface_set_target( object_surface );

draw_clear_alpha( c_black, 0 );

var d_pos_off;
d_pos_off = ship_grid_size * 0.5;

//draw ship bottom
if( sprite_exists( ship_sprite ) )
{
	draw_sprite_ext( ship_sprite, 1, d_pos_off + ship_hallign * ship_grid_size, d_pos_off + ship_vallign * ship_grid_size, 1, 1, 0, c_white, 1 );	
}

// draw grids with stored data

//draw hulls
if( draw_grid_hull_active && draw_top == false)
{
	for( var i = 0; i < draw_grid_hull_index; i++)
	{
		draw_sprite_ext( spr_hull, 0, d_pos_off + draw_grid_hull[i,1] * ship_grid_size,  d_pos_off + draw_grid_hull[i,2] * ship_grid_size, 1, 1, 0, draw_grid_hull[i,0], 1 );
	}
}


//draw objects, ship top & turrets
if( draw_grid_object_active )
{
	var obj;
	
	for( var i = 0; i < draw_grid_object_index; i++)
	{
		obj = draw_grid_object[i,0];
		if( instance_exists(obj) )
		{
			var col = c_white;
			if(obj.owner != obj.original_owner) col = c_dkgray;
			
			draw_sprite_ext( obj.sprite_index, floor(obj.animation_count),  d_pos_off + draw_grid_object[i,1] * ship_grid_size,  d_pos_off + draw_grid_object[i,2] * ship_grid_size, 1, 1, obj.direction - direction, col, 1 );
			if( obj.light_up > 0 ) draw_sprite_ext( spr_hull, 0,  d_pos_off + draw_grid_object[i,1] * ship_grid_size,  d_pos_off + draw_grid_object[i,2] * ship_grid_size, 1.1, 1.1, obj.direction - direction, c_yellow, 0.5 );
		}
	}
	
	if( sprite_exists( ship_sprite ) && draw_top )
	{
		draw_sprite_ext( ship_sprite, 0, d_pos_off + ship_hallign * ship_grid_size, d_pos_off + ship_vallign * ship_grid_size, 1, 1, 0, c_white, 1 );	
	}
	
	for( var i = 0; i < draw_grid_turret_index; i++)
	{
		obj = draw_grid_turret[i,0];
		if( instance_exists(obj) )
		{
			var col = c_white;
			if(obj.owner != obj.original_owner) 
				col = c_dkgray;
			
			draw_sprite_ext( obj.sprite_index, floor(obj.animation_count), d_pos_off + draw_grid_turret[i,1] * ship_grid_size, d_pos_off + draw_grid_turret[i,2] * ship_grid_size, 1, 1, obj.direction - direction, col, 1 );
			
			if( obj.light_up > 0 ) 
				draw_sprite_ext( spr_hull, 0, d_pos_off + draw_grid_turret[i,1] * ship_grid_size, d_pos_off + draw_grid_turret[i,2] * ship_grid_size, 1.1, 1.1, obj.direction - direction, c_yellow, 0.5 );
		}
	}
}


// DEBUG object surface border
//draw_rectangle_color( 1,1,surface_get_width(object_surface)-2, surface_get_height(object_surface)-2, c_green,c_green,c_green,c_green,true );

// reset the draw target
surface_reset_target();




// draw ship --------------------------------------------------------------
var h_width, h_height, l_l, l_d, l_x, l_y;

h_width = surface_get_width(object_surface) * 0.5 - ((ship_hallign + ship_hallign_off) * ship_grid_size);
h_height = surface_get_height(object_surface) * 0.5 - ((ship_vallign + ship_vallign_off) * ship_grid_size);

l_l = pyt( h_width, h_height );
l_d = (direction - point_direction( 0,0,h_width,h_height )) mod 360;

l_x = lengthdir_x( l_l, l_d );
l_y = lengthdir_y( l_l, l_d );

scr_camera_draw_surface( global.combat_camera, object_surface, x + l_x, y + l_y, direction );


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
	
var c_x, c_y, a0, a1;
c_x = surface_get_width( Shield_mask_surface ) * 0.5;
c_y = surface_get_height( Shield_mask_surface ) * 0.5;

a0 = 0.5;
a1 = 1.0;

scr_bezier_draw( c_x, c_y, SB0, 10, c_white, c_white, a0, a1 );
scr_bezier_draw( c_x, c_y, SB1, 10, c_white, c_white, a0, a1 );
scr_bezier_draw( c_x, c_y, SB2, 10, c_white, c_white, a0, a1 );
scr_bezier_draw( c_x, c_y, SB3, 10, c_white, c_white, a0, a1 );

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
	l_l = pyt( h_width - shield_surface_size_increase * 0.5, h_height - shield_surface_size_increase * 0.5 );
	l_d = (direction - point_direction( 0,0,h_width, h_height )) mod 360;

	l_x = lengthdir_x( l_l, l_d );
	l_y = lengthdir_y( l_l, l_d );
	
	//gpu_set_blendmode(bm_add);
	scr_camera_draw_surface( global.combat_camera, Shield_drawing_surface, x + l_x, y + l_y, direction );
	//gpu_set_blendmode(bm_normal);
}