/// @description Clean vars
// If overwritten, do not forget to copy this code

if( instance_exists( parent )) parent.draw_grid_object_recheck = true;

ds_list_destroy(children);
ds_list_destroy(allowed_type);