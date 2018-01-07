/// @description Ini vars
// This object manages all projectiles in the game


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
//		list_mod	=	8	=	modulation

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
list_ttl	=	projectile[pro_ttl];
list_spr	=	projectile[pro_spr];
list_mod	=	projectile[pro_mod];


// debug
debug_array = -1;
