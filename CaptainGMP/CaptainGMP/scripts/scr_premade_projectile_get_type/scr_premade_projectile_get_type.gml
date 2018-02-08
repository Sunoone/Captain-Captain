/// @description scr_premade_projectile_get_type( name )
/// @param name

// this script gets the type of a premade projectile

var type = -1;
var name = string_lower(argument0);

with( global.projectile_manager )
{
	for( var i = 0; i < premade_count; i++ )
	{
		if( premade[i,0] == name )
		{
			type = premade[i,1];
			break
		}
	}
}

return type;