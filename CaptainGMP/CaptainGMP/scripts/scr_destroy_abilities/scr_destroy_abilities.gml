/// @description scr_ability_destroy_structure( id )

// this script deregisters abilities and destroys the ability structure




// destroy ds_lists
ds_list_destroy( ability_gaphic );
ds_list_destroy( ability_active );
ds_list_destroy( ability_script );
ds_list_destroy( ability_tooltip );
ds_list_destroy( ability_cpu );