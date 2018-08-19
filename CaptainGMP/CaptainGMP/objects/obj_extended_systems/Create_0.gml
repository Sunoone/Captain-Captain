/// @description Ini Buff, Status & Abilities

// inherent the parent event
event_inherited();

	// Status Effect system
status_effect_out = ds_grid_create( 1, 10 );

// 0 = target ( 0 = childern, 1 = core, 2 = global, object_id)
// 1 = id
// 2 = value
// 3 = stat index
// 4 = filter (filter on inherited objects)
// 5 = not used
// 6 = name
// 7 = icon
// 8 = cost
// 9 = is_percentage

status_effect_in = ds_grid_create( 1, 12 );

// 0 = owner
// 1 = id
// 2 = origin
// 3 = value
// 4 = stat index
// 5 = stat height
// 6 = name
// 7 = icon
// 8 = cost (not used)
// 9 = not used
// 10 = target
// 11 = is_percentage

update_status_effects = true;


	// Buffs
Buff = ds_grid_create( 1, 4 );

// 0 = type
// 1 = time
	// 0 = stat
	// 2 = stat_p
	// 3 = status effect
	// 4 = status effect p
// 2 = stat index
// 3 = stat height




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
