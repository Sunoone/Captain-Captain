/// @description Initializes game constants

#macro cellsize 20

#macro softwaretype 0
#macro controllertype 1
#macro componenttype 2
#macro shiptype -1
#macro othertype -1


	// interface ring index
#macro g_type 0		// what type does this space holds?
#macro g_free 1		// can this space be used?
#macro g_parent 2	// what is this space it's parent, if any?
#macro e_id 3		// list element id
#macro e_rot 4		// list element rotation
#macro e_spr 5		// list element sprite
#macro e_link 6		// list element link
#macro e_x 7		// list element x
#macro e_y 8		// list element y
#macro e_width 9	// list element width

	// Projectile list index
#macro pro_id 0		// Projectile id
#macro pro_x 1		// Projectile x
#macro pro_y 2		// Projectile y
#macro pro_dir 3	// Projectile direction in degrees
#macro pro_speed 4	// Projectile speed in pixels per second
#macro pro_type 5	// Projectile type
#macro pro_dam 6	// Projectile damage
#macro pro_mod 7	// Projectile modulation