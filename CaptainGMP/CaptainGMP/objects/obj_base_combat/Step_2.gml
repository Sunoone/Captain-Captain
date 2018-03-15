/// @description Update

globalvar DeltaTime;

// check HP
if( HP <= 0 )
{
	instance_destroy(id);
	exit;
}

// natural HP regen
if( HP < HP_max )
{
	var r = HP_max * regen * DeltaTime;
	HP += r;
	if( HP > HP_max ) HP = HP_max;
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

// remove destroyed children & update owned childern
var size;

size = ds_list_size(children)
ds_list_clear( owned_childern );

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
	
	if( size>0 )
	{
		ds_list_copy( owned_childern, children );
		
		for( var i = size - 1; i >= 0; i-- )
		{
			if( owned_childern[|i].owner != original_owner || owned_childern[|i].secret_owner != original_owner )
			{
				ds_list_delete( owned_childern, i );	
			}
		}
	}
}

// Hacking ------------------------------------------------------------------------------------------------------------------------------
var own_c, all_c;
own_c = ds_list_size(owned_childern);
all_c = ds_list_size(children);

	// update security rating
security_rating = sqr( security_level ) * ( 1 + ( 0.5 / interface_width ) * ( own_c - all_c ) );

	// update hackability
if( quarantine )
{
	can_be_hacked = false;
	can_be_hacked_parent = false;
}
else if( type == 2 || all_c <= 0 )
{
	can_be_hacked = true;
	has_been_revealed = true;
}
else if( own_c < all_c )
{
	can_be_hacked = true;
	for( var i = all_c; i >= 0; i-- )
		children[|i].can_be_hacked_parent = true;
}
else
{
	can_be_hacked = false;
	for( var i = all_c; i >= 0; i-- )
		children[|i].can_be_hacked_parent = false;
}

// update visual light_up
if( light_up > 0 ) light_up -= DeltaTime;