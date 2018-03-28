/// @description Ini base vars
// Always inherent this event

	// Object type
type = -1; // set type of object, 0 = software, 1 = regulator, 2 = component THIS SHOULD BE OVERWRITTEN TO REGISTER WITH THE INTERFACE!
name = "Base Combat Object";

	// standard variables 
parent = -4;
owner = -4;
original_owner = -4;
animation_speed = 0; // animation speed, frames per second
animation_count = 0; //subimage
parent_direction = 0; //direction from parent
self_direction = 0;	//direction offset from parent
hp = 100;
mass = 1;
armor = 0;
rotation_lock = true; //overwite with false if the object does not rotate with it's parent
active = true; //is the object active?
children = ds_list_create(); //keeps all linked object ids
owned_childern = ds_list_create(); // a list of childern that have the same owner as the regulator
interface_width = 1; // the width of the interface element for the object
allowed_type = ds_list_create(); //keeps all objects that are able to link to this object

	// hacking
hacking_owner = ds_list_create();		// keeps track of which owner is hacking this object
hacking_level = ds_list_create();		// keeps track of the level of the hack

hacking_progress = ds_list_create();	// keeps track of the progress made by hacking

hack_detected = false;
has_been_hacked = false;
has_been_revealed = false;
can_be_hacked = false;
can_be_hacked_parent = false;

secret_owner = -4; // this determains who is the actual controller of this node, set to a ship id when hacked, -4 when free

security_level = 3; // this determains, in part, the resistance to hacking
quarantine = false; // is the node in quarantine / inventory?

	// Hacking legacy
hacked_by = -4;

	// Abilities
scr_ability_create_structure( id );
register_abilities = false;
ability_off = scr_ability_register( spr_action_off, 2, 0, 0, true, "Shut down, disables cpu cost." );
ability_on = scr_ability_register( spr_action_on, 3, 0, 0, false, "Turn on, re-enables cpu cost." );
switch_active = false;

	// health
HP_max = 100;	// max HP of object 
HP = 100;		// current HP of object
regen = 0.025;	// every sec, 2.5% hp is regained

	// interface
interface_data = 0;
interface_name_list = ds_list_create();
interface_number_list = ds_list_create();

light_up = 0; // this variable controls how long the object should light up

	// cpu
cpu_cost = 10;

	// legacy -> unknown if still used, find out if save to remove
object_surface = -1;
security_rating = 4;