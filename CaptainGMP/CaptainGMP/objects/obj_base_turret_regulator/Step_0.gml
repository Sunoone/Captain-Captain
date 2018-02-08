/// @description Aim children
// Overwite this code

if( global.player == owner )
{
	if( is_string(target_x) == false && is_string(target_y) == false )
	{
	
		var size;

		size = ds_list_size(children)

		if( size>0 )
		{
			for( var i = 0; i<size; i++ )
			{
				if( instance_exists( children[|i] ) )
				{			
					if(active)
					{
						// aim the turret
							// bug: if the aiming arc of the turret is >180 but still restrictive, the turret could 
							// get stuck at min or max angle when trying to take the shortest rotation.
					
						var target_dir, delta_dir;
						
						target_dir = point_direction( children[|i].x, children[|i].y, target_x, target_y );
						delta_dir = scr_min_angle( children[|i].direction, target_dir );
					
						children[|i].rotation_speed = delta_dir;
						
						children[|i].target_x = target_x;
						children[|i].target_y = target_y;
					}
				}
			}
		}
	}
}