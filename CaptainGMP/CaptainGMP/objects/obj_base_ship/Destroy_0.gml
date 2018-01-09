/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// destroy all objects on ship_grid
for( var i = 0; i < ship_grid_width; i++ )
{
	for( var j = 0; j < ship_grid_height; j++ )
	{
		var obj = scr_3d_array_get( ship_grid, i, j, ship_object );
		if( instance_exists( obj ) ) instance_destroy( obj );
	}
}

// destroy the ship_grid 3d array
scr_3d_array_destroy( ship_grid );