/// @description scr_ability_excecute_script( mode, script, target_id, core )
/// @param mode
/// @param script
/// @param target_id
/// @param core


// this script exicutes the given ability script with the right arguments and retuns the results

// Mode:
// 0 = test
// 1 = cost
// 2 = time
// 3 = real


switch( argument1 )
{
	case 0:
		return scr_ability_0_hack( argument0, argument2, argument3 );
	
	case 1:
		return scr_ability_1_disable( argument0, argument2, argument3 );
		
	case 2:
		return scr_ability_2_off( argument0, argument2, argument3 );
		
	case 3:
		return scr_ability_3_on( argument0, argument2, argument3 );
	
	case 4:
		return scr_ability_4_control( argument0, argument2, argument3 );
		
	case 5:
		return scr_ability_5_raiseSecurityLevel( argument0, argument2, argument3 );
		
	case 6:
		return scr_ability_6_scan( argument0, argument2, argument3 );
		
	case 7:
		return scr_ability_7_raiseHackingLevel( argument0, argument2, argument3 );
		
	case 8:
		return scr_ability_8_exit( argument0, argument2, argument3 );
		
	case 9:
		return scr_ability_9_antivirus( argument0, argument2, argument3 );
		
	case 10:
		return scr_ability_10_ability_0_on( argument0, argument2, argument3 );
		
	case 11:
		return scr_ability_11_ability_0_off( argument0, argument2, argument3 );
	
	case 12:
		return false; // reserved for ability_1_on
		
	case 13:
		return false; // reserved for ability_1_off
	
	case 14:
		return false; // reserved for ability_2_on
		
	case 15:
		return false; // reserved for ability_2_off
	
	case 16:
		return false; // reserved for ability_3_on
		
	case 17:
		return false; // reserved for ability_3_off
	
	case 18:
		return scr_ability_18_thruster_boost_1( argument0, argument2, argument3 );
	
	default:
		return false;
}