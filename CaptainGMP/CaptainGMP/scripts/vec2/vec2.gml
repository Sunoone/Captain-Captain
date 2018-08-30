/// @description vec2(x,y);
/// @param x
/// @param y

var v = array_create( 2, 0 );

if( argument_count == 1 )
{
	var a = argument[0];
	
	if( is_array( a ) )
	{
		v[0] = a[0];
		v[1] = a[1];
	}
	else if( ds_exists( a, ds_type_list ) )
	{
		v[0] = a[| 0];
		v[1] = a[| 1];
	}
}
else if( argument_count == 2 )
{
	v[1] = argument[1];
	v[0] = argument[0];
}

return v;