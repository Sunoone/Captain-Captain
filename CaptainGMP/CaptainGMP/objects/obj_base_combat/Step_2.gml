/// @description Update

globalvar DeltaTime;

// Update position
if( instance_exists( parent ) )
{	
	// rotate with parent
	
		// if the rotation of the component is locked, rotate with parent
	if(rotation_lock) direction = self_direction + parent.direction;
	else direction += parent.direction - parent_direction;
	parent_direction = parent.direction;
	//move with parent	
	x = parent.x + lengthdir_x(off_l, parent.direction + off_d);
	y = parent.y + lengthdir_y(off_l, parent.direction + off_d);
}

//Update animation
if( animation_speed != 0)
{
	if( sprite_exists( sprite_index ) && surface_exists(object_surface) )
	{
		animation_count += animation_speed * DeltaTime;
		
		var max_animation = sprite_get_number(sprite_index) -1;
		if (max_animation == 0) animation_count = 0;
		else
		{
			if( animation_count > max_animation ) animation_count = 0;
			if( animation_count < 0 ) animation_count = max_animation;
		}
		/*
		surface_set_target( object_surface );
		
		draw_clear_alpha(c_black, 0);
		draw_sprite(sprite_index, round(animation_count) , sprite_get_xoffset(sprite_index), sprite_get_yoffset(sprite_index) );
		
		surface_reset_target();
		*/
	}
	
}

// remove destroyed children
var size;

size = ds_list_size(children)

if( size>0 )
{
	for( var i = 0; i<size; i++ )
	{
		if( instance_exists( children[|i] ) == false )
		{
			ds_list_delete(children, i);
			i--;
			size--;
		}
	}
}

// natural HP regen
if( HP < HP_max )
{
	var r = HP_max * regen * DeltaTime;
	HP += r;
	if( HP > HP_max ) HP = HP_max;
}

