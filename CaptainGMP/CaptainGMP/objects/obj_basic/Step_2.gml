/// @description animation

// Update animation
if( animation_speed != 0)
{
	if( sprite_exists( sprite_index ) )
	{
		animation_count += animation_speed * global.DeltaTime;
		
		var max_animation = sprite_get_number(sprite_index) -1;
		if (max_animation == 0) animation_count = 0;
		else
		{
			if( animation_count > max_animation ) animation_count = 0;
			if( animation_count < 0 ) animation_count = max_animation;
		}
	}
}
