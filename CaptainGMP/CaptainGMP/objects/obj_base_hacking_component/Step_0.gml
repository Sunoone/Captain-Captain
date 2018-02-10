/// @description Hacking

if( instance_exists(target_id) )
{
	hacking += global.DeltaTime;
	if( hacking >= 1 )
	{
		if( target_id.original_owner == owner ) target_id.owner = owner;
		else target_id.owner = -1 * get_timer();
		hacking = 0;
			
		audio_play_sound( snd_interface_confirm, 3, false );
		target_id = -4;
	}
}
