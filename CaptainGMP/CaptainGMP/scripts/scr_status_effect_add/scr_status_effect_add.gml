/// @description scr_status_effect_add( object_id, status_effect_name, buff_id* )
/// @param object_id
/// @param status_effect_name
/// @param buff_id*

// this script adds an existing status effect to an object from global.data
// retunrs the id of the status effect

with( global.data )
{
	var key, i;
	
	key = string_lower( argument[1] );
	if( ds_map_exists( data_status_effect_index, key ) )
		 i = ds_map_find_value( data_status_effect_index, key )
	else show_error( "Unable to find status effect '" + key + "' in global.data.data_status_effect_index.", true ) ;
	
	var buff_id = -4;
	if( argument_count > 2 )
		buff_id = argument[2];
	
	scr_status_effect_new( 
		argument[0],  
		data_status_effect[i,2],
		data_status_effect[i,3],
		data_status_effect[i,6],
		data_status_effect[i,4],
		data_status_effect[i,0],
		data_status_effect[i,1],
		data_status_effect[i,7],
		data_status_effect[i,5],
		data_status_effect[i,8],
		buff_id
	);
	
	return data_status_effect[i,8];
}