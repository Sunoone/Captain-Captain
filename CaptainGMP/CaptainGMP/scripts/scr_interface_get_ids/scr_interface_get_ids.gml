/// @description scr_interface_get_ids( interface_id, ds_list )
/// @param interface_id
/// @param ds_list

// this script loads all the node id's of the interface in the given ds_list

if( instance_exists( argument0 ) )
{
	with( argument0 )
	{
		for( var i = grid_width-1; i>=0; i-- )
		{
			for( var j = 0; j < 3; j++ )
			{
				var node = ds_grid_get( ring[j,0], i ,e_id );
				if( instance_exists( node ) )
					ds_list_add( argument1, node );
			}
		}
	}
}