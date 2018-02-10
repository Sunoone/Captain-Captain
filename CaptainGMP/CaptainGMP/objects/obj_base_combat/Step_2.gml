/// @description Update

globalvar DeltaTime;

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

//Update animation
if( animation_speed != 0)
{
	if( sprite_exists( sprite_index ) )
	{
		animation_count += animation_speed * DeltaTime;
		
		var max_animation = sprite_get_number(sprite_index) -1;
		if (max_animation == 0) animation_count = 0;
		else
		{
			if( animation_count > max_animation ) animation_count = 0;
			if( animation_count < 0 ) animation_count = max_animation;
		}
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

// update owned childern
ds_list_clear( owned_childern );

ds_list_copy( owned_childern, children );

if( size>0 )
{
	for( var i = size - 1; i >= 0; i-- )
	{
		if( owned_childern[|i].owner != owner )
		{
			ds_list_delete( owned_childern, i );	
		}
	}
}

// update security rating
security_rating = sqr( security_level ) * ( 1 + ( 0.5 / interface_width ) * ( ds_list_size(owned_childern) - ds_list_size(children) ) );

// check HP
if( HP <= 0 )
{
	instance_destroy(id);
}

// natural HP regen
if( HP < HP_max )
{
	var r = HP_max * regen * DeltaTime;
	HP += r;
	if( HP > HP_max ) HP = HP_max;
}

// update visual light_up
if( light_up > 0 ) light_up -= DeltaTime;