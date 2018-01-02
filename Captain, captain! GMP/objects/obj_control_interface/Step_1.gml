/// @description Rebalance Nodes
// This piece of code rebalances the nodes on the wheel

var list_c = 0;

for( var i = 0; i<max_rings; i++ )
{
	list_c += ds_list_size( ring[i,2] );
}


if( list_count != list_c || update == true )
{
	
	for( var i = 0; i<max_rings; i++ )
	{
		var l_size, r_rot, p_len;
		l_size = ds_list_size( ring[i,2] );
	
		if( l_size > 0 )
		{
			r_rot = 360 / ( ring[i,0] - 1 ); // ring rotation, the rotation between elements of that ring
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
	
	//update vars
	update = false;
	list_count = list_c;
}
