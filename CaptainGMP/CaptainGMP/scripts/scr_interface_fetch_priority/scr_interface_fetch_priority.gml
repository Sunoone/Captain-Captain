/// @description scr_interface_fetch_priority( node, core, ds_list, interface_id)
/// @param node
/// @param core
/// @param ds_list
/// @param interface_id

// this script fetches the highest priority ability from the given node

var node, core;

node = argument0;
core = argument1;

ds_list_clear( argument2 );

if( instance_exists( core ) )
{						
	var menu_list = ds_list_create();
	
	// fetch menu
	scr_interface_fetch_menu( menu_list, node, core, argument3 );
				
	//filter highest priority ability
	var i, priority, list_m;
	priority = 0;
	i = -1;
	list_m = ds_list_size( menu_list ) / 5;
			
	for( var n = 0; n < list_m; n++ )
	{
		if( menu_list[| n * 5 + 4] > priority )
		{
			i = n;
			priority = menu_list[| n * 5 + 4];
		}
	}
	
	if( i >= 0 )
	{
		for( var j = 0; j < 5; j++ ) 
			ds_list_add( argument2, menu_list[| i * 5 + j ] );
	}
	
	ds_list_destroy( menu_list );
}