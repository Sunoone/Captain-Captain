/// @description Initializes game constants

#macro cellsize 20

#macro softwaretype 0
#macro controllertype 1
#macro componenttype 2
#macro shiptype -1
#macro othertype -1


	// interface ring index
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
#macro pro_dir 3	// Projectile direction in degrees
#macro pro_speed 4	// Projectile speed in pixels per second
#macro pro_type 5	// Projectile type
#macro pro_dam 6	// Projectile damage
#macro pro_ttl 7	// Projectile time to live in sec
#macro pro_mod 8	// Projectile modulation