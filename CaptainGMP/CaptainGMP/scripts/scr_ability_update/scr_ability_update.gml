/// @descripotion scr_ability_update()

// this script registers the object with the owner's core if it exists


if( owner >= 0 && owner < array_length_1d(global.owned_interface) )
{
	var int = global.owned_interface[ owner ];
	
	if( instance_exists( int ) )
	{
		var core = int.core;
		
		if( instance_exists(core) )
		{
			scr_ds_list_add_unique( core.core_ability_id, id );
			register_abilities = false;
		}
	}
}