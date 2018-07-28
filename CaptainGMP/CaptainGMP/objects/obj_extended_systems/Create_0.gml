/// @description Ini Buff, Status & Abilities

// inherent the parent event
event_inherited();


	// Modifications
modification = ds_grid_create( 1, 5 );	// a list of all modifications applied to this object

	// New status effect system
status_effect_out = ds_grid_create( 1, 9 );

// 0 = target ( 0 = childern, 1 = core, 2 = global, object_id)
// 1 = id
// 2 = value
// 3 = stat index
// 4 = filter (filter on inherited objects)
// 5 = use core stats
// 6 = name
// 7 = icon
// 8 = cost

status_effect_in = ds_grid_create( 1, 9 );

// 0 = owner
// 1 = id
// 2 = origin
// 3 = value
// 4 = stat index
// 5 = stat height
// 6 = name
// 7 = icon
// 8 = cost

	// Buffs
buff = ds_grid_create( 1, 7 );			// keeps track of the buffs that are applied to this object
buff_provider = ds_grid_create( 1, 2 );	// keeps track of buffs that this object provides

buff_childern = ds_grid_create( 1, 3 ); // permanent buffs that this object provides to its childern -> 0 = index, 1 = value, 2 = icon
buffed_childern_list = ds_list_create(); // list that keeps track of which childern are buffed
// ^^^^^^^^^^^^^^^^^ do something with this list, keep track of which noded must be buffed and which nodes debufed

buff_core = ds_grid_create( 1, 4 );		// permanent buffs that this object provides to it's core	 -> 0 = index, 1 = value, 2 = icon, 3 = use_core_stat
core_buffed = false;


	// Abilities
ability_0_script = -4;					// ability 0 script
ability_0_target = id;					// ability 0 target
ability_1_script = -4;					// ability 1 script
ability_1_target = id;					// ability 1 target
ability_2_script = -4;					// ability 2 script
ability_2_target = id;					// ability 2 target
ability_3_script = -4;					// ability 3 script
ability_3_target = id;					// ability 3 target
	
	
scr_ability_create_structure( id );
register_abilities = false;
ability_off = scr_ability_register( spr_action_off, 2, 0, true, "Shut down, disables cpu cost.", 50 );
ability_on = scr_ability_register( spr_action_on, 3, 0, false, "Turn on, re-enables cpu cost.", 50 );
switch_active = !active;

ability_running[0,0] = -4;
