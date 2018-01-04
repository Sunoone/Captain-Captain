/// @description scr_ds_list_remove_value( id, value1, ... )
/// @param id
/// @param value1
/// @param ...

// this script removes the given values from the passed ds_list

var j;

for( var i = 1; i < argument_count; i++ )
{
	j = ds_list_find_index( argument[0], argument[i] );
	if( j >= 0 )
	{
		ds_list_delete( argument[0], j );
	}
}