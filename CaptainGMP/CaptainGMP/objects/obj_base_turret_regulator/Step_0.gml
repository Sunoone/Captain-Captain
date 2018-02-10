/// @description Aim owned childern
// Overwite this code

if( is_string(target_x) == false && is_string(target_y) == false )
{
	
	var size;

	size = ds_list_size(owned_childern)

	if( size>0 )
	{
		for( var i = 0; i<size; i++ )
		{
			if( instance_exists( owned_childern[|i] ) )
			{			
				if(active)
				{
					// aim the turret
						// bug: if the aiming arc of the turret is >180 but still restrictive, the turret could 
						// get stuck at min or max angle when trying to take the shortest rotation.
					
					var target_dir, delta_dir;
						
					target_dir = point_direction( owned_childern[|i].x, owned_childern[|i].y, target_x, target_y );
					delta_dir = scr_min_angle( owned_childern[|i].direction, target_dir );
					
					owned_childern[|i].rotation_speed = delta_dir;
						
					owned_childern[|i].target_x = target_x;
					owned_childern[|i].target_y = target_y;
				}
			}
		}
	}
}