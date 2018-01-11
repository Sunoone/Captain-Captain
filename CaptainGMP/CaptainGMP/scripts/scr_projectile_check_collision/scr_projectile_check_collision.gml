/// @description scr_projectile_check_collision( pos )
/// @param pos

// this script checks for projectile collision with ships and their components

// THIS SCRIPT SHOULD ONLY BE CALLED FROM THE PROJECTILE MANAGER!
	// (due to using internal variables)


//this collision only works on projectile type 1;

var registry = global.registry;

var pos, size, len, dir, x1, y1, x2, y2, XX, YY, ship, obj;
pos = argument0;
size = ds_list_size( registry );

// check all ship objects for collision
for( var i = 0; i < size; i++ )
{
		// if the owner of the ship is not equal to the owner of the projectile
	if( collision_target[i,0] != list_own[|pos] )
	{	
		// this is the current location, we need to check every location between here and +vector
		x1 = list_x[|pos];	
		y1 = list_y[|pos];
		
		x2 = collision_target[i,1];
		y2 = collision_target[i,2];
		
		len = point_distance( x1,y1,x2,y2 );
		
		// if the projectile is within the radius of the ship
		if( len < collision_target[i,3] )
		{
			// point direction from the ship origin minus the ship's direction
			dir = point_direction( x2,y2,x1,y1 ) - collision_target[i,4];
			
			// get co-ordinates relative to the ship center and add the ships center
			XX = floor(lengthdir_x( len, dir ) / ship_grid_size) + collision_target[i,5];
			YY = floor(lengthdir_y( len, dir ) / ship_grid_size) + collision_target[i,6];
			
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
						}
					}
				}
			}
		}
		
	}
}

return -1; // no collision