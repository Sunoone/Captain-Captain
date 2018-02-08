/// @description scr_premade_projectlie_add( name, type, spr_muzzle, spr_projectile, spr_impact, snd_ambient, snd_impact, *sprite_extra )
/// @param name
/// @param type
/// @param spr_muzzle
/// @param spr_projectile
/// @param spr_impact
/// @param snd_ambient
/// @param snd_impact
/// @param *sprite_extra

// this script adds a projectile to the pre-made system

if( argument_count < 7 || argument_count > 8 ) show_error( "Script 'scr_premade_projectile_add' recieved a call with an incorrect number of arguments.",true);

var man = global.projectile_manager;
var i = man.premade_count;

with( man )
{
	// pass arguments to the premade array
	premade[i,0] = string_lower(argument[0]);
	
	for( var j = 1; j < argument_count; j++ )
	{
		premade[i,j] = argument[j];
	}
	
	// add a -1 value to the optional argument if it is not provided
	if( argument_count == 7 ) premade[i,7] = -1; 
}

man.premade_count++;