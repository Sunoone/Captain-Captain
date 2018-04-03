/// @description Update Children
// You can write your code in this editor

// update all stats
if( update_variables )
{
	for( var i = array_height_2d( stat ) -1; i >= 0; i-- )
	{
		scr_status_effect_update( id, i );
	}
	update_variables = false;	
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
		if( owned_childern[|i].owner != original_owner || owned_childern[|i].secret_owner != original_owner )
		{
			ds_list_delete( owned_childern, i );	
		}
	}
}

	// Hacking
var own_c, all_c;
own_c = ds_list_size(owned_childern);
all_c = ds_list_size(children);


	// update hackability
if( quarantine )
{
	can_be_hacked = false;
	can_be_hacked_parent = false;
}
else if( all_c <= 0)
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


// CPU cost -----------------------------------------------------------------------------------------------------------------------------
if( instance_exists( parent ) && active && !quarantine )
{
	if( instance_exists( parent.ship_core ) && owner == original_owner)
	{
		var core = parent.ship_core;
	
		core.cpu_budget += stat[var_cpu_cost,0];
		
		for( var i = ds_grid_width( modification ) - 1; i > 0; i-- )
			core.cpu_budget += modification[# i, 1];
	}
}


// Abilities
if( switch_active != active)
{
		// change the active stage of all abilities
	for( var i = ds_list_size( ability_active ); i>=0; i-- )
		ability_active[|i] = active;
		
		// switch on/off abilities
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
		// find the position of the index number
	var c, p, t;
	c = ability_running[ global_player,0];
	p = ds_list_find_index( c.running_abilities_index, ability_running[global_player,1]  );
	t = c.running_abilities_time[|p];
	
	if( t > 0 )
	{
		ds_list_clear( interface_name_list );
		ds_list_clear( interface_number_list );
	
		interface_data = 1;
	
		ds_list_add( interface_name_list, "" );
		ds_list_add( interface_number_list, t );
	}
}
else interface_data = 0;