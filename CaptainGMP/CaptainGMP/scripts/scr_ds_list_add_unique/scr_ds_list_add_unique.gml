/// @description scr_ds_list_add_unique( id, value1, ... )
/// @param id
/// @param value1
/// @param ...

// this script add values to an ds_list if they do not already exists in that list

for( var i = 1; i < argument_count; i++ )
{
	if( ds_list_find_index( argument[0], argument[i] ) < 0 )
	{
		ds_list_add( argument[0], argument[i] );
	}
}