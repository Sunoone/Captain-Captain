/// @description Update Projectiles


var DeltaTime = global.DeltaTime;
var size = ds_list_size(projectile[0]);


	// Projectile list index
//		list_id		=	0	=	id
//		list_x		=	1	=	x
//		list_y		=	2	=	y
//		list_v0		=	3	=	movement vector
//		list_v1		=	4	=	movement vector
//		list_type	=	5	=	type
//		list_dam	=	6	=	damage
//		list_ttl	=	7	=	time to live in sec
//		list_spr	=	8	=	Projectile sprite
//		list_own	=	9	=	owner
//		list_mod	=	10	=	modulation



for( var i = 0; i < size; i++ )
{
	// update projectiles here
	switch( list_type[|i] )
	{
		case 0:		// simple projectile
		{
			/*
			var x1, y1, x2, y2;
			
			x1 = list_x[| i];
			y1 = list_y[| i];
			
			x2 = x1 + list_v0[| i];
			y2 = y1 + list_v1[| i];
			*/	
			
			list_ttl[|i ] -= DeltaTime;
			
			if( list_ttl[|i ] <= 0 )
			{
				scr_projectile_remove( i );
			}
			else
			{
				list_x[| i ] += list_v0[| i ] * DeltaTime;
				list_y[| i ] += list_v1[| i ] * DeltaTime;
			}
			
		}
		break;
		
		case 1:		// beam projectile
		{
			
		}
		break;		
		
		
		default:	// unknown, remove from list
		{
			scr_projectile_remove( i );
			i--;
			size--;
		}
		break;
	}
}