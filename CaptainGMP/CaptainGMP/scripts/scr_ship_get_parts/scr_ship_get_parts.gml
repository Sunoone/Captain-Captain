/// @description scr_ship_get_objects( ds_list, ship  )
/// @param ds_list
/// @param ship


// this script clears and fills the provided ds_list with all ship objects and software that are regitred with the interface

// this script is slow, avoid use

var ship, list;

list = argument0;
ship = argument1;

if( ds_exists( list, ds_type_list ) == false ) return -4;

ds_list_clear( list );

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