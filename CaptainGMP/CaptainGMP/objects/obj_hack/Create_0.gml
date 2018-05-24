/// @description Ini Hacking

// inherent the parent event
event_inherited();

	// hacking
hack_level = 0;	// keeps track of the level of the hack

hack_detected = false;
has_been_hacked = false;
has_been_revealed = false;
can_be_hacked = false;
can_be_hacked_parent = false;

quarantine = false; // is the node in quarantine / inventory?