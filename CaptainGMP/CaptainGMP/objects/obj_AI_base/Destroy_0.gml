/// @description Clean Object

for( var i = array_length_1d( action_list )-1; i>=0; i-- )
{
	if( ds_exists( action_list[i], ds_type_list ) )
		ds_list_destroy( action_list[i] );
}
