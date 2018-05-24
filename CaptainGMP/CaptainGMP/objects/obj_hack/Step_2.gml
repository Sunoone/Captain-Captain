/// @description Update Hacking

// inherent the system objects end steps ------------------------------------------------------------------------------------------------
event_inherited();

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

// CPU cost -----------------------------------------------------------------------------------------------------------------------------
if( instance_exists( parent ) && active )
{
		// Hacking cost
	if( secret_owner != original_owner && secret_owner >= 0 )
	{
		if( instance_exists(secret_core) )
		{
			secret_core.cpu_budget += scr_cost_hacking( hack_level );
		}
	}
}