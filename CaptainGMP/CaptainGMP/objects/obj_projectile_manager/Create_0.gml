/// @description Ini vars
// This object manages all projectiles in the game

global.projectile_manager = id;

for( var i = 0; i < 1 + pro_mod; i++ )
{
	projectile[i] = ds_list_create();
}

list_id		=	projectile[pro_id];
list_type	=	projectile[pro_type];
list_own	=	projectile[pro_own];

list_x		=	projectile[pro_x];
list_y		=	projectile[pro_y];

list_v0		=	projectile[pro_v0];
list_v1		=	projectile[pro_v1];

list_dir	=	projectile[pro_dir];
list_speed	=	projectile[pro_speed];

list_dam	=	projectile[pro_dam];
list_ttl	=	projectile[pro_ttl];
list_des	=	projectile[pro_des];

list_spr	=	projectile[pro_spr];
list_imp	=	projectile[pro_imp];
list_muzz	=	projectile[pro_muzz];
list_trail	=	projectile[pro_trail];

list_a_imp	=	projectile[pro_a_imp];
list_a_amb	=	projectile[pro_a_amb];

list_mod	=	projectile[pro_mod]; // unused - might do something with shielding

animation_speed = room_speed;	// animation speed in frames per second for projectiles and explosions
timerate_animation_speed = animation_speed * 0.000001;	// animation_speed ajdusted for time rate

// projectile collision
collision_target[0,8] = -1;

// set up premade projectiles
scr_premade_projectile_ini();