/// @description Ini vars
// This objects hadles the player's key-inputs


	// Directional input is meant to use with trusters
global.input_direction[0] = false;
global.input_direction[1] = 0;

directional_key[0] = ord("D");	// right
directional_key[2] = ord("A");	// left
directional_key[1] = ord("W");	// up
directional_key[3] = ord("S");	// down

directional_translation[3,1] = 0;

	// Stop key
global.input_stop[0] = false;

stop_key[0] = vk_space;
