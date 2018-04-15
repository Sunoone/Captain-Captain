/// @description scr_ship_from_owner( owner )
/// @param owner

// this script returns the ship that belongs to the owner if any can be found

var ship = -4;

for( var i = ds_list_size( global.registry ) -1; i >= 0; i-- )
{
	ship = global.registry[|i];
	
	if( instance_exists( ship ) )
	{
		if( ship.owner == argument0 )
			return ship;
	}
}


return -4;