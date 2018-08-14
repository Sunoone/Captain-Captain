/// @description Insert description here
// You can write your code in this editor

if( owner != delta_owner ) // owner has changed
{	
	// remove buffs
	scr_buff_remove( id, -1 );
	for( var i = ds_grid_width( buff_provider ) - 1; i > 0; i-- )
	{
		if( instance_exists( buff_provider[# i, 0] ) )
			scr_buff_remove( buff_provider[# i, 0], buff_provider[# i, 1] );
	}
}

// Update Buffs
for( var i = ds_grid_width( buff ) -1; i>0; i-- )
{
	if( buff[# i, 1] > 0 ) // check if buff is timed
	{
		buff[# i, 1] -= global.DeltaTime;
		if( buff[# i, 1] <= 0 )
		{
			scr_buff_remove( id, i );	
		}
	}
}

// update new status effects and remove old
if( update_status_effects )
{
	// re-check current status effects
	scr_status_effect_check(id);
	
	// request child status effects
	for( var c = ds_list_size( owned_childern ) -1; c>= 0; c--  )
	{
		if( instance_exists( owned_childern[| c] ) )
			scr_status_effect_request( id, owned_childern[| c], 3 );
	}
	
	// request root status effects
	if( instance_exists( root ) )
		scr_status_effect_request( id, root, 0 );
	
	update_status_effects = false;
}

// inherent the system objects end steps --------------------------------------------------------------------------------------------------------
event_inherited();


// Active change -> Does not belong in active
if( switch_active != active )
{
	// Buffs
	if( !active )
	{
		// remove all buffs that this object provides
		for( var i = ds_grid_width( buff_provider )-1; i>0; i-- )
			scr_buff_provider_destroy_buff(id, i );
			
		// clear list of buffed childern
		ds_list_clear(buffed_childern_list);
		
		// set core buffed to false
		core_buffed = false;
	}
	else // object is active
	{
		// re-enables all standart buffs that this object provides
			// buff owned childern
		for( var i = ds_list_size(owned_childern)-1; i >= 0; i-- )
		{
			for( var j = ds_grid_width( buff_childern )-1; j > 0; j-- )
				scr_buff_add( owned_childern[|i], id, -1, false, buff_childern[# j, 0], buff_childern[# j, 1], buff_childern[# j, 2] );
			
			scr_ds_list_add_unique( buffed_childern_list, owned_childern[|i] );
		}
			
			// buff core
		for( var i = ds_grid_width( buff_core )-1; i > 0; i-- )
			scr_buff_add( core, id, -1, buff_core[# i, 3], buff_core[# i, 0], buff_core[# i, 1], buff_core[# i, 2] );
		
		core_buffed = true;
	}
	
	// Abilities
		// Change the active stage of all abilities
	for( var i = ds_list_size( ability_active ); i>=0; i-- )
		ability_active[|i] = active;
		
		// Switch on/off abilities
	scr_ability_set_active( ability_on, !active );
	
}

if( register_abilities )
	scr_ability_update();

// CPU cost -----------------------------------------------------------------------------------------------------------------------------
if( instance_exists( parent ) && active )
{	
		// Status Effect Cost
	var effect_owner;
	for( var i = ds_grid_width( modification ) - 1; i > 0; i-- )
	{	
		effect_owner = modification[# i, 0];
		
		if( instance_exists( effect_owner ) ) // check if the owner core exists
			effect_owner.cpu_budget += modification[# i, 1];
		else
		{
			//scr_status_effect_remove(id, i);
		}
	}
}