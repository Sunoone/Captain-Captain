/// @description Add Hack Target

if( global.player == owner )
{
	if( switch_active ) // debug
	{
		switch_active = false;
		var size = ds_list_size(children);
		
		ds_list_clear(target_id);
		
		for( var i = size-1; i >= 0; i-- )
			ds_list_clear( children[|i].target_id );
	}
	
	var int_a, length;
	
	int_a = global.interface_select_id;
	length = array_length_1d( int_a )
	
	for( var i = 0; i < length; i++ ) // search through the interface select array if there is a new target
	{
		if( instance_exists( int_a[i] ) && scr_ds_list_value_exist( target_id, int_a[i] ) == false && int_a[i] > 0 )
		{
			if( int_a[i].original_owner != owner ) // limity hacking to only enemy ship
			{
				if( int_a[i].can_be_hacked || int_a[i].can_be_hacked_parent )
				{
					var obj = int_a[i];
					
					ds_list_insert( target_id, 0, obj ); // add the new target to the list
				
					break;
				}
			}
		}
	}
}