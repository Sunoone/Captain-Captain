/// @description Ini vars

// Inherit the parent event
event_inherited();

// Overwrite and add vars here
name = "Base Ship Object";
type = -1;

// core object reference
ship_core = -4;
cpu = 0;

// add ship to the ship registry
scr_ds_list_add_unique( global.registry, id );

ship_grid = scr_3d_array_create( 1 , 1 , 3 );
ship_grid_width = 1;
ship_grid_height = 1;

armor = 0;	// ship armor value that protects components

// draw grids
draw_grid_hull[0,0] = -1;
draw_grid_hull_index = 0;
draw_grid_hull_recheck = true;
draw_grid_hull_active = false;

draw_grid_object[0,0] = -1;
draw_grid_object_index = 0;
draw_grid_object_recheck = true;
draw_grid_object_active = false;

draw_grid_turret[0,0] = -1;
draw_grid_turret_index = 0;

// ship sprite
ship_sprite = -1;
ship_hallign = 0;
ship_vallign = 0;
ship_hallign_off = 0;
ship_vallign_off = 0;

draw_top = true;


// Shielding
shield = 0; // ship shield value ( value is added by shield )
shield_list = ds_list_create(); // a list of all shield generator components that are adding to the shield

	// Shape
SB0 = scr_bezier_create( vec2( 130, 0 ), vec2(130, 40), vec2( 40, 115 ), vec2( -100, 115) );
SB1 = scr_bezier_create( vec2( -100, 115), vec2( -120,115 ), vec2( -180, 110 ), vec2( -180, 0 ) );
SB2 = scr_bezier_create( vec2( -100, -115), vec2( -120,-115 ), vec2( -180, -110 ), vec2( -180, 0 ) );
SB3 = scr_bezier_create( vec2( 130, 0 ), vec2(130, -40), vec2( 40, -115 ), vec2( -100, -115) );

shield_height = 30;

shield_surface_size_increase = 100;

	// Shaders
shield_height_uniform = shader_get_uniform( sha_shield, "max_height" );
shield_center_point_uniform = shader_get_uniform( sha_shield, "center_point" );
mask_shader_base_sampler = shader_get_sampler_index( sha_mask, "base_surface");
mask_shader_texture_scale_uniform = shader_get_uniform( sha_mask, "texture_scale" );

	// Surface
Shield_surface = -4;
Shield_mask_surface = -4;

// Hacking
hackable_parts_list = ds_list_create();

// stats
stat[var_mass, 1] = 400000;		// weight of an average 747
stat[var_drag, 1] = 0.5;		// 25% drag per sec
scr_stat_update( id );			// updates all stats

// internal variables
object_surface = -4;


// Movement
inertia = vector_create( 0, 0 );
torque = 0;
movement = ds_list_create();
rotation = ds_list_create();


// Flight Model
drag_coefficient = 0.031; // this is the drag coefficient of a 747
drag_area_front = 16; // this is the front cross-sectional area of a 747
drag_area_side = 24; // this is the side cross-sectional area
air_density = scr_air_density( 1000, 35 ); // this need to be recalculated for each level

drag = 0;
d_dir = 0;
mod_dir = 0;
m_area = 0;
area = 16;
torque_drag = 0;
aero_torque_drag = 0;

aero_control = 5000;

// DEBUG
screen_offset_x = scr_screen_surface_get_x( global.combat_screen_index );
screen_offset_y = scr_screen_surface_get_y( global.combat_screen_index );
