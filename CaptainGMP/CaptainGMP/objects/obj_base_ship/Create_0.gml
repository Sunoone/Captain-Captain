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

draw_top = false;

// hacking
hackable_parts_list = ds_list_create();

// stats
stat[var_mass, 1] = 100000;
stat[var_drag, 1] = 0.5;		// 25% drag per sec
scr_stat_update( id );			// updates all stats

// internal variables
object_surface = -4;


// Movement
inertia = vector_create( 0, 0 );
torque = 0;
movement = ds_list_create();
rotation = ds_list_create();

// DEBUG
screen_offset_x = scr_screen_surface_get_x( global.combat_screen_index );
screen_offset_y = scr_screen_surface_get_y( global.combat_screen_index );