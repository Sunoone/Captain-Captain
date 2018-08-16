/// @description scr_stat_add( object_id, stat_index, value, use_core_stat*, percentage* )
/// @param object_id
/// @param stat_index
/// @param value
/// @param use_core_stat*
/// @param percentage*

// this script adds a stat and returns the position

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
	
	var m, i;
	m = array_length_2d( ar, argument[1] );
	
	for( i = 2; i < m; i++ )
	{
		if( ar[ argument[1], i] == 0 )
		{
			break;
		}
	}
	ar[@  argument[1], i] = argument[2];
	scr_stat_update( argument[0], argument[1], corestat );
	return i;
}