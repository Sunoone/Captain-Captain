/// @description clean lists

// Inherit the parent event
event_inherited();

// write code here

/* Legacy
for( var i = ds_list_size( hacked_list ) - 1; i >= 0; i-- )
{
	if( instance_exists( hacked_list[|i] ) )
	{
		if( hacked_list[|i].hacked_by == id )
			hacked_list[|i].hacked_by = -4;
	}
}

ds_list_destroy(hacked_list);