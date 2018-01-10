/// @description Clean Lists and Array

var length = array_length_1d(projectile);

for( var i = 0; i < length; i++ )
{
	if( ds_exists(projectile[i], ds_type_list ) )
	{
		ds_list_destroy( projectile[i] );
	}
}
projectile = 0;