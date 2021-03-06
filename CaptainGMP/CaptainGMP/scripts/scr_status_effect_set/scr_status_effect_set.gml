/// @description scr_status_effect_set( object_id, origin, id )
/// @param object_id
/// @param origin
/// @param id

// This script adds a status effect to an object
// This script assumes you have done all of the checking already

var s = scr_ds_grid_find_value_width( argument1.status_effect_out, argument2, 1 )

with( argument0 )
{
	if( scr_ds_grid_find_value_width( status_effect_in, argument2, 1 ) != -1 ) 
		exit;
	
	var i = scr_ds_grid_add_column( status_effect_in )
	
		//debug
	if( argument1.status_effect_out[# s, 9] == true )
	{
		var debug = true;
	}
	
	
	status_effect_in[# i,0] = argument1.owner;												// owner
	status_effect_in[# i,1] = argument2;													// id
	status_effect_in[# i,2] = argument1;													// origin
	status_effect_in[# i,3] = argument1.status_effect_out[# s, 2];							// value
	status_effect_in[# i,4] = argument1.status_effect_out[# s, 3];							// stat index
	status_effect_in[# i,5] = scr_stat_add(													// stat height
								argument0, 
								status_effect_in[# i, 4], 
								status_effect_in[# i, 3],  
								argument1.status_effect_out[# s, 9]); 
	status_effect_in[# i,6] = argument1.status_effect_out[# s, 6];							// name
	status_effect_in[# i,7] = argument1.status_effect_out[# s, 7];							// icon
	status_effect_in[# i,8] = argument1.status_effect_out[# s, 5];							// buff id
	status_effect_in[# i,9] = argument1.status_effect_out[# s, 10];							// invisible to interface
	status_effect_in[# i,10] = argument1.status_effect_out[# s, 0];							// target
	status_effect_in[# i,11] = argument1.status_effect_out[# s, 9];							// is_percentage
}