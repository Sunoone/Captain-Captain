/// @description Ini vars
// You can write your code in this editor

// Inherit the parent event
event_inherited();

type = -2;
name = "Base Core";

HP_max = 250;
HP = 200;

software = ds_list_create();

// CPU
cpu_cost = 0;

cpu = 5000;
cpu_bonus = 0;
cpu_budget = 0;
cpu_available = 0;

// Hacking
hacking_level = 1;
scan_level = 1;

// Abilities
scr_ability_register( spr_action_basic_hack, 0, 1, true, "Hack this node" );
scr_ability_register( spr_action_disrupt,	 1, 3, true, "Disrupt this node, rendering it inoperable" );

core_ability_id = ds_list_create();
ds_list_add( core_ability_id, id );

running_abilities_index = ds_list_create();
running_abilities_time = ds_list_create();
running_abilities_script = ds_list_create();
running_abilities_target = ds_list_create();
running_abilities_icon = ds_list_create();
running_abilities_cost = ds_list_create();
