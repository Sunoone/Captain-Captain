/// @description Ini Buff, Status & Abilities

// inherent the parent event
event_inherited();

	// Status Effect system
status_effect_out = ds_grid_create( 1, 11 );

// 0 = target ( 0 = children, 1 = core, 2 = global, 3 = root, 4 = all linked, 5 = all linked, including self, 6 = self, 7 = ship, object_id)
// 1 = id
// 2 = value
// 3 = stat index
// 4 = filter (filter on inherited objects)
// 5 = buff id (if from buff)
// 6 = name
// 7 = icon
// 8 = cost
// 9 = is_percentage
// 10 = invisible to interface

status_effect_in = ds_grid_create( 1, 12 );

// 0 = owner
// 1 = id
// 2 = origin
// 3 = value
// 4 = stat index
// 5 = stat height
// 6 = name
// 7 = icon
// 8 = buff id (if from buff)
// 9 = invisible to interface
// 10 = target
// 11 = is_percentage

update_status_effects = true;


	// Buffs
Buff = ds_grid_create( 1, 7 );

// 0 = name
// 1 = status_effect_id
// 2 = buff id
// 3 = time
// 4 = status effect id
// 5 = owner
// 6 = buff type, 0 = friendly, 1 = enemy, 2 = both


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
