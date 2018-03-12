/// @description debug switch active

if( global.player == owner )
{
	if( switch_active )
	{
		switch_active = false;
		var size = ds_list_size(children);
		
		ds_list_clear(attack_id);
		
		for( var i = size-1; i >= 0; i-- )
			ds_list_clear( children[|i].attack_id );
	}
	else
		switch_active = true;
}