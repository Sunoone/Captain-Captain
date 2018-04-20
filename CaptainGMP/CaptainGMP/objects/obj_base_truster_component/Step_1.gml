/// @description Apply Thrust

thrust = 0;

if( !active || !instance_exists( parent ) )
	exit;

	// Calculate thrust based on angle offset from player input
if( owner == global.player )
{
	if( global.input_direction[0] )
	{
		var dir = angle_difference( direction+180, global.input_direction[1] );
		if( dir < 90 && dir > -90 )
		{
			thrust = cos( dir / 180 * pi ) * stat[ var_maxThrust, 0];
		}		
	}
}



if( thrust != 0 )
{
		// Calculate & apply Torque
	

		// Apply Thrust
	ds_list_add( parent.movement, vector_create_from_direction( direction+180, thrust ) );
}