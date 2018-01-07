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
//		list_ttl	=	7	=	time to live in sec
//		list_spr	=	8	=	Projectile sprite
//		list_mod	=	9	=	modulation



for( var i = 0; i < size; i++ )
{
	// update projectiles here
	switch( list_type[|i] )
	{
		case 0:		// simple projectile
		{
			var x1, y1, x2, y2, dir, len;
			
			dir = projectile[| pro_dir];
			len = projectile[| pro_speed];
			
			x1 = projectile[| pro_x];
			y1 = projectile[| pro_y];
			
			x2 = x1 + lengthdir_x( len, dir );
			y2 = x2 + lengthdir_y( len, dir );
						
		}
		break;
		
		case 1:		// beam projectile
		{
			
		}
		break;		
		
		
		default:	// unknown, remove from list
		{
			
			i--;
			size--;
		}
		break;
	}
}