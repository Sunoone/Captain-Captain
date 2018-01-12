/// @description scr_projectile_check_collision( pos, v0, v1 )
/// @param pos
/// @param v0
/// @param v1

// this script checks for projectile collision with ships and their components
	// this script deals with the collision event

// THIS SCRIPT SHOULD ONLY BE CALLED FROM THE PROJECTILE MANAGER!
	// (due to using internal variables)

// determines every how many pixels the script checks for collision on a line
var accuracy = 4;

// get globals
var registry = global.registry;

// declare vars
var pos, size, len, dir, x_base, y_base, v_x, v_y, vdx, vdy, x1, y1, x2, y2, XX, YY, ship, obj;
pos = argument0;
v_x = argument1;
v_y = argument2;
size = ds_list_size( registry );



switch( list_type[|pos] )
{
	case 0: // projectile
	case 2: // missile
	// check all ship objects for collision
	for( var i = 0; i < size; i++ )
	{
			// if the owner of the ship is not equal to the owner of the projectile
		if( collision_target[i,0] != list_own[|pos] )
		{	
			x_base = list_x[|pos];
			y_base = list_y[|pos];
			
			var d = ceil( point_distance( x_base, y_base, x_base + v_x, y_base + v_y ) ) / accuracy;
			if( d <= 0) d = 1;
			
			vdx = v_x / d;
			vdy = v_y / d;
			
			for( var j = 0; j < d; j++ )
			{
				// this is the current location, we need to check every location between here and +vector
				x1 = x_base + vdx * j;	
				y1 = y_base + vdy * j;
			
				x2 = collision_target[i,1];
				y2 = collision_target[i,2];
		
				len = point_distance( x1,y1,x2,y2 );
		
				// if the projectile is within the radius of the ship
				if( len < collision_target[i,3] )
				{
					// point direction from the ship origin minus the ship's direction
					dir = point_direction( x2,y2,x1,y1 ) - collision_target[i,4];
			
					// get co-ordinates relative to the ship center and add the ships center
					XX = floor( lengthdir_x( len, dir ) / ship_grid_size + collision_target[i,5] );
					YY = floor( lengthdir_y( len, dir ) / ship_grid_size + collision_target[i,6] );
			
					if( XX >= 0 && YY >= 0 )
					{
						if( XX < collision_target[i,7] && YY < collision_target[i,8] )
						{
							ship = registry[|i];
					
							if( scr_3d_array_get( ship.ship_grid, XX, YY, ship_valid ) )
							{
								// ship is hit
								obj = scr_3d_array_get( ship.ship_grid, XX, YY, ship_object );
								if( instance_exists( obj ) && obj != -1 )
								{
									// damage object and explode projectile
									obj.HP -= list_dam[|pos];
							
									list_des[|pos] = true;
									list_ttl[|pos] = 0;
							
									list_x[|pos] = round( list_x[|pos] );
									list_y[|pos] = round( list_y[|pos] );
									
									return obj;
								}
							}
						}
					}
				}
			}
		}
	}
	break;
	
	default:
	break;
}

return -1; // no collision