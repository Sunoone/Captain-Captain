/// @description scr_ship_pos_check( ship, object, grid_x, grid_y )
/// @param ship
/// @param object
/// @param grid_x
/// @param grid_y

// this scriipt returns if the object can be placed on the ship at the co-ordinates

	// check if co_ordinates are valid
if( round( argument2 ) != argument2 || round( argument3 ) != argument3 ) return false;
if( argument2 >= argument0.ship_grid_width || argument3 >= argument0.ship_grid_height ) return false;

var array = argument0.ship_grid;

	// check if space is valid
if( scr_3d_array_get( array, argument2, argument3, ship_valid ) == false ) return false;

	// check if space accepts object type
var type = scr_3d_array_get( array, argument2, argument3, ship_type );
if( type == sh_none ) 
{
	if( scr_object_check_parentage( argument1, sh_combat_component ) ) 
		return false;
	
	if( scr_object_check_parentage( argument1, sh_truster_component ) ) 
		return false;
		
	if( scr_object_check_parentage( argument1, sh_core ) ) 
		return false;
}
else if( !scr_object_check_parentage( argument1, type ) ) return false;


	// check if space is not already occupied
var inst = scr_3d_array_get( array, argument2, argument3, ship_object );
if( inst < 0 ) return true;
if( instance_exists( inst ) ) return false;


// return true if all checks where passed
return true;