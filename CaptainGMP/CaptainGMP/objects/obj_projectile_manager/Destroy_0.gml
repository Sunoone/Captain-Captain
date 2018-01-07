/// @description Clean Lists and Array

list_id		=	0;
list_x		=	0;
list_y		=	0;
list_dir	=	0;
list_speed	=	0;
list_type	=	0;
list_dam	=	0;
list_ttl	=	0;
list_mod	=	0;



var length = array_length_1d(projectile);

for( var i = 0; i < length; i++ )
{
	if( ds_exists(projectile[i], ds_type_list ) )
	{
		ds_list_destroy( projectile[i] );
	}
}
projectile = 0;