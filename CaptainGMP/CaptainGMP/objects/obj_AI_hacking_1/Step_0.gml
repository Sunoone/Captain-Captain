/// @description hack targets

	// exit in case of ship no longer existing
if( !instance_exists( target_ship ) || !instance_exists( target_core ) )
	exit;

// preform hack
scr_AI_preform_action( 0, hacking_script, core, hacking_sprite, AI_action_limit, -4 );

// preform advanced hack
scr_AI_preform_action( 1, advanced_script, core, advanced_sprite, AI_action_limit, snd_interface_warning_2 );
