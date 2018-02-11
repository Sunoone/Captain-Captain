/// @description scr_ship_get_objects( ship )
/// @param ship

// this script returns a ds_list with all ship objects and software that are regitred with the interface

var ship, list;

ship = argument0;

list = ds_list_create();

if( instance_exists(ship) == false ) return list;

var w,h,obj,grid;
w = ship.ship_grid_width;
h = ship.ship_grid_height;
grid = ship.ship_grid;

for( var i = 0; i < w; i++ )
{
	for( var j = 0; j < h; j++ )
	{
		obj = scr_3d_array_get( grid, i, j, ship_object )
		
		if( instance_exists( obj ) )
		{
			if( obj.type >= 0 && obj.type <= 2 )
				ds_list_add( list, obj );
		}
	}
}