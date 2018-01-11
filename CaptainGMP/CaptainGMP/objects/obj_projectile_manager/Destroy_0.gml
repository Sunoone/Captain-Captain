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


// destroy collision target data
for( var i = 0; i < col_data; i++ )
{
	ds_list_destroy( collision_target[i] );
}
collision_target = 0;