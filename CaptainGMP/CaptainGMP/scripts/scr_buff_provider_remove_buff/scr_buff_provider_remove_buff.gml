/// @description scr_buff_provider_remove_buff( id, index )
/// @param provider_id
/// @param index

// this script removes a buff based on provider reference
with( argument0 )
{
	if( instance_exists( buff_provider[# argument1, 0] ) )
		scr_buff_remove( buff_provider[# argument1, 0], buff_provider[# argument1, 1] );
}