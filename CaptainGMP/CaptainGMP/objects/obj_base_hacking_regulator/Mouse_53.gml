/// @description Add Hack Target

/*
if( global.player == owner )
{
	var int_a, length;

	int_a = global.interface_select_id;
	length = array_length_1d( int_a )
	
	for( var i = 0; i < length; i++ ) // search through the interface select array if there is a new target
	{
		if( instance_exists( int_a[i] ) && scr_ds_list_value_exist( target_id, int_a[i] ) == false && int_a[i] > 0 )
		{
			if( int_a[i].original_owner != owner ) // limity hacking to only enemy ship
			{
				while( ds_list_size( target_id ) >= interface_width ) ds_list_delete( target_id, 0 ); // make room for the new target
					
				ds_list_add( target_id, int_a[i] ); // add the new target to the list
				
				break;
			}
		}
	}
}
*/