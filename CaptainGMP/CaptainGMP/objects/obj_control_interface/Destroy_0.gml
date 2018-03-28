/// @description Clean arrays

// destroy ds_lists contained in ring
var a_length = array_height_2d(ring);

for( var i = 0; i<a_length; i++)
{
	var a_height = array_length_2d(ring, i)
	
	for( var j = 0; j < a_height; j++ )
	{
		if( ds_exists(ring[i,j], ds_type_list) ) ds_list_destroy( ring[i,j] );
	}
}

ring = 0;

ds_list_destroy( inventory );
//ds_list_destroy( menu_options_list );
//ds_list_destroy( menu_options_graphics );

ds_list_destroy( menu_options );