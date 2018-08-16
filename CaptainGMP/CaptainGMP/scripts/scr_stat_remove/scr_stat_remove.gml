/// @description scr_stat_add( object_id, stat_index, stat_height, use_core_stat*, percentage* )
/// @param object_id
/// @param stat_index
/// @param stat_height
/// @param use_core_stat*
/// @param percentage*

// this script removes a stat (sets it to 0)

var corestat = false;
if(argument_count > 3 )
	corestat = argument[3];

var percentage = false;
if( argument_count > 4 )
	percentage = argument[4];

with( argument[0] )
{
		// get the right stat array
	var ar = scr_stat_get_array( argument[0], corestat, percentage );
	
	ar[@ argument[1], argument[2] ] = 0;
	scr_stat_update( argument[0], argument[1], corestat );
}