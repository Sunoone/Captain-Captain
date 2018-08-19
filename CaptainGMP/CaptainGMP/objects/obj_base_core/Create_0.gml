/// @description Ini vars
// You can write your code in this editor

// Inherit the parent event
event_inherited();

type = -2;
name = "Base Core";

	// stats
stat[var_HP, 1] = 500;				// current HP of object
stat[var_HP_max, 1] = 500;			// max HP of object 
stat[var_regen, 1] = 0.05;			// every sec, 2.5% hp is regained
stat[var_cpu_cost, 1] = 0;

	// stat - core specific
stat[var_core_cpu, 1] = 5000;
stat[var_core_cpu_bonus, 1] = 0;
stat[var_core_cpu_budget, 1] = 0;
stat[var_core_cpu_available, 1] = 0;
stat[var_core_sensor_range, 1] = 1000;
stat[var_core_hacking_level, 1] = 3;
stat[var_core_scan_level, 1] = 3;
stat[var_core_camera_mode, 1] = 0;

software = ds_list_create();

// CPU
cpu = 5000;
cpu_bonus = 0;
cpu_budget = 0;
cpu_available = 0;

// Hacking
hacking_level = 3;
scan_level = 3;

// Abilities
scr_ability_register( spr_action_basic_hack, 0, 1, true, "Hack this node", 100 );

scr_ability_register( spr_action_scan,		 6, 2, true, "Scan this node", 40 );

scr_ability_register( spr_action_disrupt,	 1, 3, true, "Disrupt this node", 50 );
scr_ability_register( spr_action_exit,		 8, 3, true, "Exit Node, removes Status Effects", 20 );

scr_ability_register( spr_action_antivirus,	 9, 4, true, "Antivirus - Regain control of this node", 100 );


core_ability_id = ds_list_create();
ds_list_add( core_ability_id, id );

running_abilities_index = ds_list_create();
running_abilities_time = ds_list_create();
running_abilities_script = ds_list_create();
running_abilities_target = ds_list_create();
running_abilities_icon = ds_list_create();
running_abilities_cost = ds_list_create();
running_abilities_maxTime = ds_list_create();
running_abilities_sound = ds_list_create();

// AI
AI[0] = -4;