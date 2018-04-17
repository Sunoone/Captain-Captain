/// @description Update

globalvar DeltaTime;

// Update all stats
if( update_variables )
{
	for( var i = array_height_2d( stat ) -1; i >= 0; i-- )
	{
		scr_status_effect_update( id, i );
	}
	update_variables = false;	
}

// Owner change
if( owner != delta_owner ) // owner has changed
{	
	if( owner >= 0 && owner < array_length_1d(global.owner_core) )
	{	
		if( instance_exists( global.owner_core[ owner ] ) )
		{
			core = global.owner_core[ owner ];
			delta_owner = owner;
			register_abilities = true;
		}
	}
}

// Update Active
if( !instance_exists( core ) )
	active = false;

// Check HP
if( stat[var_HP,0] <= 0 )
{
	instance_destroy(id);
	exit;
}

// Natural HP regen
if( stat[var_HP,0] < stat[var_HP_max,0] )
{
	var r = stat[var_HP_max,0] * stat[var_regen,0] * DeltaTime;
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

// Remove destroyed children & update owned childern
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

var secret_core = -4;
if( secret_owner >= 0 )
	secret_core = global.owner_core[ secret_owner ];

	// Update hackability
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


if( instance_exists( secret_core ) )
	apparent_owner[ secret_owner ] = secret_owner;

// Update visual light_up
if( light_up > 0 ) light_up -= DeltaTime;


// CPU cost -----------------------------------------------------------------------------------------------------------------------------
if( instance_exists( parent ) && !quarantine )
{
		// base CPU cost
	if( instance_exists( core ) && active )
	{			
		core.cpu_budget += stat[var_cpu_cost,0];
	}
	
	
		// Hacking cost
	if( secret_owner != original_owner && secret_owner >= 0 )
	{
		if( instance_exists(secret_core) )
		{
			secret_core.cpu_budget += scr_cost_hacking( hack_level );
		}
	}
	
		// Status Effect Cost
	var effect_owner;
	for( var i = ds_grid_width( modification ) - 1; i > 0; i-- )
	{	
		effect_owner = modification[# i, 0];
		
		if( instance_exists( effect_owner ) ) // check if the owner core exists
			effect_owner.cpu_budget += modification[# i, 1];
		else
			scr_status_effect_remove(id, i);
	}
}


// Abilities
if( switch_active != active )
{
		// Change the active stage of all abilities
	for( var i = ds_list_size( ability_active ); i>=0; i-- )
		ability_active[|i] = active;
		
		// Switch on/off abilities
	if( active )
		scr_ability_set_active( ability_on, false );
	else
		scr_ability_set_active( ability_on, true );
	
	switch_active = active;
}

if( register_abilities )
	scr_ability_update();

// Update interface
var global_player = global.player;

if( scr_ability_check_running( id, global_player ) )
{
		// Find the position of the index number
	var c, p, t, m;
	c = ability_running[ global_player,0];
	p = ds_list_find_index( c.running_abilities_index, ability_running[global_player,1]  );
	t = c.running_abilities_time[|p];
	m = c.running_abilities_maxTime[|p];
	
	if( t > 0 )
	{
		ds_list_clear( interface_name_list );
		ds_list_clear( interface_number_list );
		
		interface_data = 1;
		
		ds_list_add( interface_name_list, m );
		ds_list_add( interface_number_list, t );
	}
}
else interface_data = 0;