/// @description scr_stat_add( object_id, stat_index, stat_height, use_core_stat* )
/// @param object_id
/// @param stat_index
/// @param stat_height
/// @param use_core_stat*

// this script removes a stat (sets it to 0)

var corestat = false;
if(argument_count > 3 )
	corestat = argument[3];

// show_error( "error trace" ,true);

with( argument[0] )
{
	var ar;
	if( corestat ) ar = core_stat;
	else ar = stat;
	
	ar[@ argument[1], argument[2] ] = 0;
	scr_stat_update( argument[0], argument[1], corestat );
}