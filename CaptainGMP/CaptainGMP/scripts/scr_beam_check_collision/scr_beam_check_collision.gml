/// @description scr_beam_check_collision( pos )
/// @param pos
/// @param v0
/// @param v1

// this script checks collision for a beam projectile
	// on collision, this scrips adjusts the length of the beam and deals with the collision object

// THIS SCRIPT SHOULD ONLY BE CALLED FROM THE PROJECTILE MANAGER!
	// (due to using internal variables)

	// determines every how many pixels the script checks for collision on a line
var accuracy = 4;

	// declare vars
var pos, size, len, dir, x_base, y_base, v_x, v_y, vdx, vdy, x1, y1, x2, y2, XX, YY, ship, obj, grid_of_ships;
pos = argument0;
v_x = list_v0[|pos];
v_y = list_v1[|pos];

x_base = list_x[|pos];
y_base = list_y[|pos];

size = ds_list_size( global.registry );

/*
grid_of_ships = ds_grid_create( 3, size );






// check all ship objects for distance to origin
for( var i = 0; i < size; i++ ) 
{
	x2 = collision_target[i,1];
	y2 = collision_target[i,2];
		
	grid_of_ships[# 0, i ] = collision_target[i,9]; // obj id
	grid_of_ships[# 1, i ] = point_distance( x_base,y_base,x2,y2 ); // length
	grid_of_ships[# 2, i ] = i; // place in registry
}
ds_grid_sort( grid_of_ships, 1, true );


	//	Method 1:
		// Determain if the angle gets to 90 deg to the ship
			// Determain if the distance at 90 deg is shorter than the collision radius of the ship
				// Do the normal collision checking on the ship grid	
	
// check all ship objects for collision
for( var k = 0; k < size; k++ ) 
{
	var i = grid_of_ships[# 2, k ];
	
	// if the owner of the ship is not equal to the owner of the projectile
	if( collision_target[i,0] != list_own[|pos] )
	{	
		var dir, len, d_dir;
		
		x2 = collision_target[i,1];
		y2 = collision_target[i,2];
		
		dir = point_direction( x_base, y_base, x2, y2 );
		len = grid_of_ships[# 1, k ];
		
		d_dir = ( dir - list_dir[|i] ) mod 360;
		if(d_dir <= -360) d_dir = -1 * ( abs( d_dir ) mod 360 );
		
			// case 1: beam is pointing towards the ship
		if( abs( d_dir ) < 90 && len > collision_target[i,3] )
		{
			// get the intersection point
		}
			// case 2: beam is within target area
		else if( len <= collision_target[i,3] )
		{
			// get the starting collision point
		}
		
	}
}



	// Method 2:
		// Find out if the beam vector will intersect the collision box of the ship
			// Find out where the beam vector will intersect the collision box
				// Calculate ship grid intersection with the beam vector

*/


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
						ship = collision_target[i,9];
					
						if( scr_3d_array_get( ship.ship_grid, XX, YY, ship_valid ) )
						{
							// ship is hit
							obj = scr_3d_array_get( ship.ship_grid, XX, YY, ship_object );
							if( instance_exists( obj ) && obj != -1 )
							{
								// damage object and limit the length of the beam
								obj.stat[var_HP,0] -= list_dam[|pos] * global.DeltaTime;
							
								list_speed[|pos] = point_distance( x_base, y_base, x1, y1 );
									
								return obj;
							}
						}
					}
				}
			}
		}
	}
}

list_speed[|pos] = point_distance( 0,0,v_x,v_y );

return -1; // no collision