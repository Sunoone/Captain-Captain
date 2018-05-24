/// @description HP, active, xy & animation

// Natural HP regen
if( stat[var_HP,0] < stat[var_HP_max,0] )
{
	var r = stat[var_HP_max,0] * stat[var_regen,0] * global.DeltaTime;
	stat[var_HP,0] += r;
	if( stat[var_HP,0] > stat[var_HP_max,0] ) stat[var_HP,0] = stat[var_HP_max,0];
}

// Update position
if( instance_exists( parent ) )
{	
	// rotate with parent
	
		// if the rotation of the component is locked, rotate with parent
	if(rotation_lock) direction = self_direction + parent.direction;
		//note: non-rotation locked objects must provide their own rotation code 
	
	//move with parent	
	x = parent.x + lengthdir_x(off_l, parent.direction + off_d);
	y = parent.y + lengthdir_y(off_l, parent.direction + off_d);
}

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
