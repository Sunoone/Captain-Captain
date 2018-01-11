/// @description Ini vars
// This object manages all projectiles in the game


	// Projectile list index
//		list_id		=	0	=	id
//		list_x		=	1	=	x
//		list_y		=	2	=	y
//		list_v0		=	3	=	movement vector
//		list_v1		=	4	=	movement vector
//		list_dir	=	5	=	direction
//		list_speed	=	6	=	speed
//		list_type	=	7	=	type
//		list_dam	=	8	=	damage
//		list_ttl	=	9	=	time to live in sec
//		list_spr	=	10	=	Projectile sprite
//		list_exp	=	11	=	Explosion sprite
//		list_own	=	12	=	owner
//		list_mod	=	13	=	modulation

for( var i = 0; i < 1 + pro_mod; i++ )
{
	projectile[i] = ds_list_create();
}

list_id		=	projectile[pro_id];
list_x		=	projectile[pro_x];
list_y		=	projectile[pro_y];
list_v0		=	projectile[pro_v0];
list_v1		=	projectile[pro_v1];
list_dir	=	projectile[pro_dir];
list_speed	=	projectile[pro_speed];
list_type	=	projectile[pro_type];
list_dam	=	projectile[pro_dam];
list_ttl	=	projectile[pro_ttl];
list_spr	=	projectile[pro_spr];
list_exp	=	projectile[pro_exp];
list_des	=	projectile[pro_des];
list_own	=	projectile[pro_own];
list_mod	=	projectile[pro_mod]; // unused - will do something with shielding

animation_speed = 30;	// animation speed in frames per second for projectiles and explosions
timerate_animation_speed = animation_speed * 0.000001;	// animation_speed ajdusted for time rate

// projectile collision
collision_target[0,8] = -1;
