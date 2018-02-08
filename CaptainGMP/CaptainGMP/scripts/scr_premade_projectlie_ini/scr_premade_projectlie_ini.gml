/// @description scr_premade_projectlie_ini()

// this script sets up the pre-made projectile system
// this script adds the pre-made projectiles to the projectile manager

var man = global.projectile_manager;

man.premade[0,0] = -1;
man.premade_count = 0;

with( man )
{
	// add projectiles here
	scr_premade_projectlie_add( "debug_laser", 0, -1, spr_laser_1, spr_laser_explosion_1, -1, snd_impact_1 );
	scr_premade_projectlie_add( "debug_beam", 1, spr_beam_muzzle_1, spr_beam_1, spr_beam_impact_1, snd_beam_ambient, snd_impact_3 );
	scr_premade_projectlie_add( "debug_missile", 2, -1, spr_missile_1, spr_laser_explosion_1, snd_missile_engine, snd_impact_2, spr_beam_1 );
	
}