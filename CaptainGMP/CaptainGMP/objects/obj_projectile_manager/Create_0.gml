/// @description Ini vars
// This object manages all projectiles in the game


	// Projectile list index
//		pro_id		=	0	=		id
//		pro_x		=	1	=		x
//		pro_y		=	2	=		y
//		pro_dir		=	3	=		direction in degrees
//		pro_speed	=	4	=		speed in pixels per second
//		pro_type	=	5	=		type
//		pro_dam		=	6	=		damage
//		pro_mod		=	7	=		modulation

for( var i = 0; i < 1 + pro_mod; i++ )
{
	projectile[i] = ds_list_create();
}

list_id		=	projectile[pro_id];
list_x		=	projectile[pro_x];
list_y		=	projectile[pro_y];
list_dir	=	projectile[pro_dir];
list_speed	=	projectile[pro_speed];
list_type	=	projectile[pro_type];
list_dam	=	projectile[pro_dam];
list_mod	=	projectile[pro_mod];
