/// @description Update Projectiles


// update collision targets
var col_obj, registry;
registry = global.registry;

for( var i = 0; i < ds_list_size( registry ); i++ )
{
	col_obj = ds_list_find_value( global.registry, i );
	collision_target[i,0] = col_obj.owner;
	collision_target[i,1] = col_obj.x;
	collision_target[i,2] = col_obj.y;
	
	var x1, x2, y1, y2;
	x1 = col_obj.ship_hallign * ship_grid_size;
	y1 = col_obj.ship_vallign * ship_grid_size;
	x2 = col_obj.ship_grid_width * ship_grid_size - x1;
	y2 = col_obj.ship_grid_height * ship_grid_size - y1;
	
	collision_target[i,3] = round(max( point_distance(0,0,x1,y1), point_distance(0,0,x1,y2), point_distance(0,0,x2,y1), point_distance(0,0,x2,y2) ));	//rad

	collision_target[i,4] = col_obj.direction;
	collision_target[i,5] = col_obj.ship_hallign + col_obj.ship_hallign_off;
	collision_target[i,6] = col_obj.ship_vallign + col_obj.ship_vallign_off;
	collision_target[i,7] = col_obj.ship_grid_width;
	collision_target[i,8] = col_obj.ship_grid_height;
	collision_target[i,9] = col_obj;
}




// update projectiles

var DeltaTime = global.DeltaTime;
var size = ds_list_size(projectile[0]);

for( var i = 0; i < size; i++ )
{
	// update projectiles here
	switch( list_type[|i] )
	{
		case 0:		// arcing projectile -----------------------------------------------------------------------
		{
			list_ttl[|i ] -= DeltaTime;
			
			if( list_ttl[|i ] <= 0 )
			{
				if( list_des[|i] == false ) // projectile timed out
					scr_projectile_remove( i );
				else if( floor(abs(list_ttl[|i ] * animation_speed)) >= sprite_get_number( list_imp[|i] ) )
					scr_projectile_remove( i );
			}
			else
			{			
				var v0 = list_v0[| i ] * DeltaTime;
				var v1 = list_v1[| i ] * DeltaTime;
				
				if( scr_projectile_check_collision( i, v0, v1 ) < 0 )
				{
					list_x[| i ] += v0;
					list_y[| i ] += v1;
				}
			}
		}
		break;
		
		case 1:		// beam projectile -------------------------------------------------------------------------
		{
			/*
			list_ttl[|i ] -= DeltaTime;
			
			if( list_ttl[|i ] <= 0 )
			{
				scr_projectile_remove( i );
			}
			else
			{							
				// check where the beam ends
				scr_beam_check_collision( i );
			}
			*/
		}
		break;		
		
		case 2:		// missiles ---------------------------------------------------------------------------------
		{
			/*
			list_ttl[|i ] -= DeltaTime;
			
			if( list_ttl[|i ] <= 0 )
			{
				if( list_des[|i] == false ) // projectile timed out
					scr_projectile_remove( i );
				else if( floor(abs(list_ttl[|i ] * animation_speed)) >= sprite_get_number( list_imp[|i] ) )
					scr_projectile_remove( i );
			}
			else
			{			
				// rotate missile towards direction
				var o_dir = point_direction( 0,0, list_v0[| i ], list_v1[| i ] );
				
				if( o_dir != list_dir[|i] mod 360 )
				{
					var ang = scr_min_angle( o_dir, list_dir[|i] );
				
					// clamp the rotation, this is a value based on speed CHANGE THIS VALUE TO A PROPER LISTED VARIABLE A.S.A.P.
					ang = clamp( ang * (DeltaTime*2.5), -list_speed[|i], list_speed[|i] );			
					o_dir += ang;
				
					//reacalculate the vector
					list_v0[| i ] = lengthdir_x( list_speed[|i], o_dir );
					list_v1[| i ] = lengthdir_y( list_speed[|i], o_dir );					
				}
				
				// chage missile position based on it's vector
				var v0 = list_v0[| i ] * DeltaTime;
				var v1 = list_v1[| i ] * DeltaTime;
				
				if( scr_projectile_check_collision( i, v0, v1 ) < 0 )
				{
					list_x[| i ] += v0;
					list_y[| i ] += v1;
				}
			}
			*/
		}
		break;
		
		default:	// unknown, remove from list
		{
			scr_projectile_remove( i );
			i--;
			size--;
		}
		break;
	}
}