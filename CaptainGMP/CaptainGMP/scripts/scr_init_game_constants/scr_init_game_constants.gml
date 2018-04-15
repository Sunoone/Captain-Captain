/// @description Initializes game constants

#macro cellsize 20

#macro softwaretype 0
#macro controllertype 1
#macro componenttype 2
#macro shiptype -1
#macro othertype -1


	// Interface ring index
#macro g_free 0		// can this space be used?
#macro g_parent 1	// what is this space it's parent, if any?
#macro e_id 2		// list element id
#macro e_rot 3		// list element rotation
#macro e_spr 4		// list element sprite
#macro e_link 5		// list element link
#macro e_x 6		// list element x
#macro e_y 7		// list element y
#macro e_width 8	// list element width
#macro e_visible 9	// list element visible


	// Projectile list index
#macro pro_id 0		// Projectile id
#macro pro_type 1	// Projectile type
#macro pro_own 2	// Projectile owner

#macro pro_x 3		// Projectile x
#macro pro_y 4		// Projectile y

#macro pro_v0 5		// Projectile movement vector0
#macro pro_v1 6		// Projectile movement vector1

#macro pro_dir 7	// Projectile direction
#macro pro_speed 8	// Projectile speed

#macro pro_dam 9	// Projectile damage
#macro pro_ttl 10	// Projectile time to live in sec
#macro pro_des 11	// Projectile Destruction

#macro pro_spr 12	// Projectile sprite
#macro pro_imp 13	// Projectile impact sprite
#macro pro_muzz 14	// Projectile muzzle sprite
#macro pro_trail 15	// Projectile trail sprite

#macro pro_a_imp 16	// Projectile audio impact
#macro pro_a_amb 17	// Projectile audio ambient

#macro pro_mod 18	// Projectile modulation


	// Ship Grids
#macro ship_valid 0
#macro ship_type 1
#macro ship_object 2

#macro ship_grid_size 21

	// Ship Object Index Type
#macro sh_none -1	
#macro sh_combat_component obj_base_turret_component	
#macro sh_truster_component obj_base_truster_component
#macro sh_core obj_base_core

	// constant
#macro max_int 2147483647	// the maximum size that a 32-bit signed int can take (this #macro is used)

	// Base Object Variables
#macro var_HP 0
#macro var_HP_max 1
#macro var_regen 2
#macro var_cpu_cost 3
#macro var_security_level 4
#macro var_ability_0_active 5