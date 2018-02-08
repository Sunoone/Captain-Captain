/// @description scr_add_projectile_premade( name, owner, x, y, v0, v1, dam, ttl )
/// @param name
/// @param owner
/// @param x
/// @param y
/// @param v0
/// @param v1
/// @param dam
/// @param ttl

var name, p_id;
name = string_lower( argument0 );
p_id = -1;

with( global.projectile_manager )
{
	for( var i = 0; i < premade_count; i++ )
	{
		if( premade[i,0] == name )
		{
			p_id = scr_projectile_add( argument1, premade[i,1], argument2, argument3, argument4, argument5, argument6, argument7, premade[i,3], premade[i,4], premade[i,2], premade[i,7], premade[i,5], premade[i,6] );
			break;
		}
	}
}

return p_id; // return the id of the projectile