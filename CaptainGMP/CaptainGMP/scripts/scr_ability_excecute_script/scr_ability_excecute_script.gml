/// @description scr_ability_excecute_script( script, target_id, owner )
/// @param script
/// @param target_id
/// @param owner

// this script exicutes the given ability script with the right arguments

switch( argument0 )
{
	case 0:
		scr_ability_0_hack( argument1, argument2 );
		break;
	
	case 1:
		scr_ability_1_disable( argument1 );
		break;
		
	case 2:
		scr_ability_2_off( argument1 );
		break;
		
	case 3:
		scr_ability_3_on( argument1 );
		break;
	
	case 4:
		scr_ability_4_control( argument1, argument2 );
		break;
	
	default:
		break;
}