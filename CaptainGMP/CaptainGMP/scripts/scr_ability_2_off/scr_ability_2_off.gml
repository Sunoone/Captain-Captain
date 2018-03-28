/// @description scr_ability_2_off( id )
/// @param id

// this script de-activates an object

if( instance_exists( argument0 ) )
{
	argument0.active = false;	
}