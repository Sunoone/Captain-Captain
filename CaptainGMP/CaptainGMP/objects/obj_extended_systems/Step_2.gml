/// @description Insert description here
// You can write your code in this editor


// update new status effects and remove old
if( update_status_effects )
{
	// re-check current status effects
	scr_status_effect_check(id);
	
	// request child status effects
	for( var c = ds_list_size( owned_childern ) -1; c>= 0; c--  )
	{
		if( instance_exists( owned_childern[| c] ) )
			scr_status_effect_request( id, owned_childern[|c] );
	}
	
	// request root status effects
	if( instance_exists( root ) )
		scr_status_effect_request( id, root );
	
	// force update childern
	for( var i = ds_list_size(owned_childern)-1; i>=0; i--)
	{
		if( instance_exists(owned_childern[|i]) )
			owned_childern[|i].update_status_effects = true;
	}
	update_status_effects = false;
}

if( owner != delta_owner ) // owner has changed
{	
	scr_status_effect_retract(id);
	scr_status_effect_push(id);
	update_status_effects = true;
}

// inherent the system objects end steps --------------------------------------------------------------------------------------------------------
event_inherited();

// Active change -> Does not belong in active
if( switch_active != active )
{
	// Status effects
	if( !active )
		scr_status_effect_retract( id );
	else
		scr_status_effect_push( id );
	
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
if( active )
{	
	if( instance_exists( parent ) && instance_exists(core) )
	{
			// Status Effect Cost
		for( var i = array_height_2d(status_effect_out) - 1; i>0; i-- )
		{
			if( status_effect_out[# i,8 ] != 0 )
			{
				core.cpu_budget += status_effect_out[# i,8 ];
			}
		}
	}
}