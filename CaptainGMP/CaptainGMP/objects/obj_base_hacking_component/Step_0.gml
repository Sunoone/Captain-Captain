/// @description Hacking

// calculate hacking speed
var hacking_speed = clock_speed + bonus_clock;

for( var i = ds_list_size( hacked_list ) - 1; i >= 0; i-- )
{
	if( instance_exists( hacked_list[|i] ) )
	{
		if( hacked_list[|i].hacked_by == id )
		{
			if( hacking_speed >= hack_cost )
				hacking_speed -= hack_cost;	// hacking speed is decreased by the hacking cost
			else
			{
				hacked_list[|i].hacked_by = -4;
				ds_list_delete( hacked_list, i );
			}
		}
		else
			ds_list_delete( hacked_list, i );
	}
	else
		ds_list_delete( hacked_list, i );
}



switch( mode )
{
	case 0: // hacking
	{
		sprite_index = sprite_mode_0;
		
	}
	break;
	
	case 1: // antivirus
	{
		sprite_index = sprite_mode_1;
		
	}
	break;
}




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
	else if( target_id.quarantine )
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
			
			target_id.hacking_progress[|index] += hacking_speed * global.DeltaTime;	// contribute to hack
			
			if( target_id.hacking_level[|index] > max_hack_level ) 
				target_id.hacking_level[|index] = max_hack_level;	// the level of the hack is determained by the lowest level sub_prosessor
	
			if( target_id.hacking_progress[|index] >= target_id.security_rating )	// did I hack the component?
			{
				if( target_id.original_owner == owner )
				{
					// antivirus
					
					target_id.hacked_by = -4;
					
					target_id.owner = owner;	// reset ownership
					
				}
				else
				{
					// hacked enemy node
					
					target_id.hacked_by = id;
					ds_list_add( hacked_list, target_id );
					
					target_id.owner = -1 * get_timer();	// scramble ownership
					target_id.has_been_hacked = true;
					target_id.has_been_revealed = true;
					
					if( owner == global.player )
						audio_play_sound( snd_interface_confirm, 3, false );
				}
				
				ds_list_clear( target_id.hacking_owner );
				ds_list_clear( target_id.hacking_level );
				ds_list_clear( target_id.hacking_progress );
				
				target_id = -4;	// reset targeting
			}
		}
	}
}
