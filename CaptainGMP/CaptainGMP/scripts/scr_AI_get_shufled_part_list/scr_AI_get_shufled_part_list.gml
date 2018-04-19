/// @description scr_AI_get_shufled_part_list( index )
/// @param index

// this script adds all parts and software to the action list with the given index and shuffles the list

var i = argument0;

	// fill list with parts
scr_AI_get_part_list( target_index, action_list[i] );
ds_list_shuffle( action_list[i] );