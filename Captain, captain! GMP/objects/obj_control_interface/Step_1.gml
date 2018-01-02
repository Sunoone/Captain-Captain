/// @description Rebalance Nodes
// This piece of code rebalances the nodes on the wheel

var list_c = 0;

for( var i = 0; i<max_rings; i++ )
{
	list_c += ds_list_size( ring[i,2] );
}

if( list_count != list_c || update == true )
{
	/*
	for( var i = 0; i<max_rings; i++ )
	{
		var l_size, r_rot, p_len;
		l_size = ds_list_size( ring[i,2] );
	
		if( l_size > 0 )
		{
			r_rot = 360 / l_size; // ring rotation, the average rotation between elements of that ring
			p_len = (rad_0*0.5) - (r_dist*0.5) + (r_dist*i);
		
			for( var j = 0; j<l_size; j++ )
			{
				var e_rot = r_rot * j;
				
				ds_list_set( ring[i,2], j, e_rot); // rotation
				
				ds_list_set( ring[i,6], j, s_width + lengthdir_x( p_len, e_rot ) ); // x
				ds_list_set( ring[i,7], j, s_height + lengthdir_y( p_len, e_rot ) ); // y
			}
		}
	}
	*/
	
	var grouping;
	grouping[max_rings] = -4;
	
	for( var i = max_rings-1; i>=0; i-- )
	{
		var l_size = ds_list_size( ring[i,2] );

		//find parents
		if( l_size>0 )
		{
			grouping[i] = ds_grid_create( l_size, 3 );
			
			for( var j = 0; j<l_size; j++)
			{
				ds_grid_add( grouping[i], j, 0, ds_list_find_value( ring[i,5], j ) ); //parent id
				ds_grid_add( grouping[i], j, 1, ds_list_find_value( ring[i,1], j ) ); //object id
				ds_grid_add( grouping[i], j, 2, j ); //position
			}
		}
	}
	
	// order according to parent || type
	for( var i = max_rings-1; i>=0; i-- )
	{
		// get max spaces
		var b_max = ring[i,0];
		var l_size = ds_list_size( ring[i,2] );
		
		// the angle between consecutive elements 
		var c_angle = 360 / b_max;
		
		// the max angle that is not taken up by consecutive elements
		var c_space = 360 - c_angle * l_size;
		
		
		
		
		if( l_size>0 )
		{
			var sorting_list = ds_list_create();
			
			ds_grid_sort( grouping[i], 0, false );
			
			for( var j = 0; j<l_size; j++)
			{
				if( instance_exists( ds_grid_get( grouping[i], j, 0 ) ) )
				{
					//sort arrording to parent
					ds_list_add( ds_grid_get( grouping[i], j, 2 ) );
				}
				else
				{
					//sort according to type
				}
			}
			
			ds_list_destroy( sorting_list );
		}
		
	}
		
	//clean ds_gid && array
	//for( var i = max_rings-1; i>=0; i-- ) { ds_grid_destroy(grouping[i]); }
	//grouping = 0;
	
	//update vars
	update = false;
	list_count = list_c;
}