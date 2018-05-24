/// @description Clean

if( instance_exists( parent ) && type != 0 ) 
{
		// remove self out off the ship grid
	scr_3d_array_set( parent.ship_grid, grid_x, grid_y, ship_object, -1 );
	parent.draw_grid_object_recheck = true;	
}
