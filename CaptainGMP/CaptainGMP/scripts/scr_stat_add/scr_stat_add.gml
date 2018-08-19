/// @description scr_stat_add( object_id, stat_index, value, percentage* )
/// @param object_id
/// @param stat_index
/// @param value
/// @param percentage*

// this script adds a stat and returns the position

var percentage = false;
if( argument_count > 3 )
	percentage = argument[3];

with( argument[0] )
{
		// get the right stat array
	var ar = scr_stat_get_array( argument[0], percentage );
	
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
	scr_stat_update( argument[0], argument[1] );
	return i;
}