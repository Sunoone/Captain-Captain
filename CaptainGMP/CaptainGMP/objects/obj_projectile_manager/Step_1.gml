/// @description Update Projectiles

var size = ds_list_size(projectile[0]);


	// Projectile list index
//		list_id		=	0	=	id
//		list_x		=	1	=	x
//		list_x		=	2	=	y
//		list_dir	=	3	=	direction in degrees
//		list_speed	=	4	=	speed in pixels per second
//		list_type	=	5	=	type
//		list_dam	=	6	=	damage
//		list_mod	=	7	=	modulation



for( var i = 0; i < size; i++ )
{
	// update projectiles here
	switch( list_type[|i] )
	{
		case 0:		// simple projectile
		
		break;
		
		
		
		
		default:	// unknown, remove from list
		{
			
			i--;
			size--;
		}
		break;
	}
}