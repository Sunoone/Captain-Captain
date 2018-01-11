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
	if( parent.ship_core == id ) parent.ship_core = -1;
}