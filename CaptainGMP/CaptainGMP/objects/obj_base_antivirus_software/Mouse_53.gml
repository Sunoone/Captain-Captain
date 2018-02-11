/// @description prioritise Scan Target


if( global.player == owner )
{
	var int_a, length;

	int_a = global.interface_select_id;
	length = array_length_1d( int_a )
	
	for( var i = 0; i < length; i++ ) // search through the interface select array if there is a new target
	{
		if( instance_exists( int_a[i] ) && scr_ds_list_value_exist( target_id, int_a[i] ) == false && int_a[i] > 0 )
		{
			if( int_a[i].original_owner == owner ) // limit antivirus to own ship
			{
				ds_list_insert( target_id, 0, int_a[i] ); // insert the new target to the list
				
				break;
			}
		}
	}
}
