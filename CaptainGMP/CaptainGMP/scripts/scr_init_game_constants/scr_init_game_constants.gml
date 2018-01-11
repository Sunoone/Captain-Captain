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

	// Projectile list index
#macro pro_id 0		// Projectile id
#macro pro_x 1		// Projectile x
#macro pro_y 2		// Projectile y
#macro pro_v0 3		// Projectile movement vector
#macro pro_v1 4		// Projectile movement vector
#macro pro_dir 5	// Projectile direction
#macro pro_speed 6	// Projectile speed
#macro pro_type 7	// Projectile type
#macro pro_dam 8	// Projectile damage
#macro pro_ttl 9	// Projectile time to live in sec
#macro pro_spr 10	// Projectile sprite
#macro pro_exp 11	// Projectile Explosion sprite
#macro pro_des 12	// Projectile Destruction
#macro pro_own 13	// Projectile owner
#macro pro_mod 14	// Projectile modulation

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

