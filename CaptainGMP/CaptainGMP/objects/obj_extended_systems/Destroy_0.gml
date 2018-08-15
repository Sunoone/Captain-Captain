/// @description Clean




// destroy buffs
/*
scr_buff_remove( id, -1 );
for( var i = ds_grid_width( buff_provider ) - 1; i > 0; i-- )
{
	scr_buff_provider_destroy_buff(id, i );
}

ds_grid_destroy(buff);
ds_grid_destroy(buff_provider);
ds_grid_destroy(buff_childern);
ds_grid_destroy(buff_core);

ds_list_destroy(buffed_childern_list);

	// destroy status effect modificaion grid
ds_grid_destroy(modification);
*/


	// destroy abilities
scr_ability_destroy_structure( id );

// Inherit the parent event
event_inherited();

	// remove status effects
scr_status_effect_retract( id );

ds_grid_destroy(status_effect_out);
ds_grid_destroy(status_effect_in);
