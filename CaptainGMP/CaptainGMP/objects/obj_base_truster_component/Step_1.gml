/// @description Apply Thrust

thrust = 0;
torque = 0;
thrust_direction = (self_direction + 270) mod 360;

if( !active || !instance_exists( parent ) )
	exit;

	// Calculate thrust based on angle offset from player input
if( owner == global.player )
{
	if( global.input_direction[0] )
	{
		var dir = angle_difference( thrust_direction, global.input_direction[1] );
		if( dir < 90 && dir > -90 )
		{
			thrust = cos( dir / 180 * pi ) * stat[ var_maxThrust, 0];
			//thrust = stat[ var_maxThrust, 0];
			
			thrust_vector[0] = lengthdir_x( thrust, direction + 180 );
			thrust_vector[1] = lengthdir_y( thrust, direction + 180  );
		}		
	}
}



if( thrust != 0 )
{
		// Calculate & apply Torque
	parent_position[0] = parent.x;
	parent_position[1] = parent.y;
	
	application_point[0] = x;
	application_point[1] = y;
	
	torque = -1 * round( vector_calc_torque( parent_position, application_point, thrust_vector ) );
	
		// Apply Thrust
	ds_list_add( parent.movement, thrust_vector );
	
		// Apply Torque
	if( torque != 0 )
		ds_list_add( parent.rotation, torque );
}