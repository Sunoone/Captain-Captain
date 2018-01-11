/// @description Clean vars
// If overwritten, do not forget to copy this code

if( instance_exists( parent )) 
{
		// destroy self out off the ship grid
	scr_3d_array_set( parent.ship_grid, grid_x, grid_y, ship_object, -1 );
	parent.draw_grid_object_recheck = true;	
}

ds_list_destroy(children);
ds_list_destroy(allowed_type);