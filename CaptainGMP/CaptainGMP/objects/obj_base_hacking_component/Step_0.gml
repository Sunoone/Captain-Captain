/// @description Hacking

	// are we hacking a real object?
if( instance_exists(target_id) )
{
	if( target_id.owner == owner )
	{
		target_id = -4;	// reset targeting
	}
	else if( target_id.can_be_hacked == false && target_id.can_be_hacked_parent == false  )
	{
		target_id = -4;	// reset targeting
	}
	else if( target_id.owner < 0 && owner != target_id.original_owner )
	{
		target_id = -4;	// reset targeting
	}
	else
	{
		var index = ds_list_find_index( target_id.hacking_owner, owner ) // find out if the object is already being hacked
	
		if( index == -1 ) // start a new hack
		{
			index = ds_list_size(target_id.hacking_owner);
			
			ds_list_add( target_id.hacking_owner, owner );
			ds_list_add( target_id.hacking_level, max_hack_level );
			ds_list_add( target_id.hacking_progress, 0 );
		}
		
		if( target_id.hacking_progress[|index] >= target_id.security_rating ) // is the object already hacked?
		{
			target_id = -4;	// reset targeting
		}
		else
		{
			if( target_id.original_owner == owner )
				bonus_clock = clock_speed * defence_bonus;
			else
				bonus_clock = 0;
			
			target_id.hacking_progress[|index] += ( clock_speed + bonus_clock ) * global.DeltaTime;	// contribute to hack
			
			if( target_id.hacking_level[|index] > max_hack_level ) 
				target_id.hacking_level[|index] = max_hack_level;	// the level of the hack is determained by the lowest level sub_prosessor
	
			if( target_id.hacking_progress[|index] >= target_id.security_rating )	// did I hack the component?
			{
				if( target_id.original_owner == owner ) 
					target_id.owner = owner;	// reset ownership
				else
				{
					target_id.owner = -1 * get_timer();	// scramble ownership
					target_id.has_been_hacked = true;
					target_id.has_been_revealed = true;
				}
				
				ds_list_clear( target_id.hacking_owner );
				ds_list_clear( target_id.hacking_level );
				ds_list_clear( target_id.hacking_progress );
				
				//audio_play_sound( snd_interface_confirm, 3, false );
				
				target_id = -4;	// reset targeting
			}
		}
	}
}
