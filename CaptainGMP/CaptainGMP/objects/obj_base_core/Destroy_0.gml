/// @description Kill Ship

// Inherit the parent event
event_inherited();

// Write Destruction code here
for( var i = 0; i < ds_list_size( software ); i++ )
{
	instance_destroy( software[|i] );	
}
ds_list_destroy(software);

if( instance_exists( parent ) )
{
	if( parent.ship_core == id ) parent.ship_core = -4;
}

// clear ds lists
ds_list_destroy( core_ability_id )

ds_list_destroy( running_abilities_index );
ds_list_destroy( running_abilities_time );
ds_list_destroy( running_abilities_script );
ds_list_destroy( running_abilities_target );
ds_list_destroy( running_abilities_icon );
ds_list_destroy( running_abilities_cost );