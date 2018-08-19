/// @description scr_stat_add( object_id, stat_index, stat_height, percentage* )
/// @param object_id
/// @param stat_index
/// @param stat_height
/// @param percentage*

// this script removes a stat (sets it to 0)

var percentage = false;
if( argument_count > 3 )
	percentage = argument[3];

with( argument[0] )
{
		// get the right stat array
	var ar = scr_stat_get_array( argument[0], percentage );
	
	ar[@ argument[1], argument[2] ] = 0;
	scr_stat_update( argument[0], argument[1] );
}