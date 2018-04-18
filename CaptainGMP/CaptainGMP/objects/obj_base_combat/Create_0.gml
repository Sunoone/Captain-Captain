/// @description Ini base vars
// Always inherent this event

	// Object type
type = -1; // set type of object, 0 = software, 1 = regulator, 2 = component THIS SHOULD BE OVERWRITTEN TO REGISTER WITH THE INTERFACE!
name = "Base Combat Object";

	// standard variables 
parent = -4;
core = -4;
active = true; //is the object active?

	// animation
animation_speed = 0; // animation speed, frames per second
animation_count = 0; //subimage
parent_direction = 0; //direction from parent
self_direction = 0;	//direction offset from parent
rotation_lock = true; //overwite with false if the object does not rotate with it's parent


	// Owner
owner = -4;
secret_owner = -4; // this determains who is the actual controller of this node
apparent_owner[0] = -4;
original_owner = -4;
delta_owner = owner;


	// stats
update_variables = true;

stat[var_HP, 1] = 100;					// current HP of object
stat[var_HP_max, 1] = 100;				// max HP of object 
stat[var_regen, 1] = 0.025;				// every sec, 2.5% hp is regained
stat[var_cpu_cost, 1] = 100;			// base cost of object
stat[var_security_level, 1] = 1;		// resistance to hacking
stat[var_ability_0_active, 1] = 0;		// object ability 0 active
	ability_0_script = -4;					// ability 0 script
	ability_0_target = id;					// ability 0 target



	// Status Effects
modification = ds_grid_create( 1, 5 );


	// hacking
hack_level = 0;	// keeps track of the level of the hack

hack_detected = false;
has_been_hacked = false;
has_been_revealed = false;
can_be_hacked = false;
can_be_hacked_parent = false;

quarantine = false; // is the node in quarantine / inventory?


	// Abilities
scr_ability_create_structure( id );
register_abilities = false;
ability_off = scr_ability_register( spr_action_off, 2, 0, true, "Shut down, disables cpu cost.", 30 );
ability_on = scr_ability_register( spr_action_on, 3, 0, false, "Turn on, re-enables cpu cost.", 30 );
switch_active = false;

ability_running[0,0] = -4;


	// interface
interface_width = 1;	// the width of the interface element for the object
interface_data = 0;
interface_name_list = ds_list_create();
interface_number_list = ds_list_create();

children = ds_list_create(); //keeps all linked object ids
owned_childern = ds_list_create(); // a list of childern that have the same owner as the regulator
allowed_type = ds_list_create(); //keeps all objects that are able to link to this object

light_up = 0; // this variable controls how long the object should light up
