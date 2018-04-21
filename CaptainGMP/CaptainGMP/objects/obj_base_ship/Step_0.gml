/// @description update 

// calculate movement, check out of bounds, draw grids, 

// Update CPU
if( instance_exists( ship_core ) )
	cpu = ship_core.cpu_available;
else
	cpu = 0;

// Movement ------------------------------------------------------------------
var vector_delta;
var dampen = 1000 / (stat[var_mass, 0] / global.DeltaTime);

	// add force to inertia from thrusters
for( var i = ds_list_size( movement )-1; i >= 0; i-- )
{
	vector_delta = movement[|i];
	vector_delta[0] *= dampen;
	vector_delta[1] *= dampen;
	
	inertia = vector_add( inertia, vector_delta );
}
ds_list_clear( movement );

	// add force to torque from thrusters
for( var i = ds_list_size( rotation )-1; i >= 0; i-- )
{
	torque += rotation[|i]
}
ds_list_clear( rotation );

	// Apply drag on inertia
if( inertia[0] != 0 || inertia[1] != 0 )
{
	inertia[0] -= (inertia[0] * stat[var_drag, 0] * global.DeltaTime);
	inertia[1] -= (inertia[1] * stat[var_drag, 0] * global.DeltaTime);
}

	// Apply drag on torque
if( inertia[0] != 0 || inertia[1] != 0 )
{
	torque -= (torque * stat[var_drag, 0] * global.DeltaTime);
}

	// Move ship
x += inertia[0];
y += inertia[1];

	// Rotate the ship
direction += ( torque / ( stat[var_mass, 0] * 0.75 ) ) * global.DeltaTime;

// fix out of bounds - DEBUG
if( surface_exists( global.combat_screen ) )
{
	var s_x,s_y,s_w,s_h;
	
	//s_x = scr_screen_surface_get_x( global.combat_screen_index );
	//s_y = scr_screen_surface_get_y( global.combat_screen_index );
	
	s_x = 0;
	s_y = 0;
	
	s_w = surface_get_width( global.combat_screen );
	s_h = surface_get_height( global.combat_screen );
	
	while( x < s_x ) x+= s_w;
	while( x > s_x + s_w ) x -= s_w;
	
	while( y < s_y ) y+= s_h;
	while( y > s_y + s_h ) y -= s_h;
}



	// recheck the hull draw grid  ---------------------------------------------------------------------
if( draw_grid_hull_recheck )
{
	draw_grid_hull_index = 0;
	
	for( var i = 0; i < ship_grid_width; i++)
	{
		for( var j = 0; j < ship_grid_height; j++ )
		{
			if( scr_3d_array_get( ship_grid, i, j, ship_valid ) )
			{
				var col;
			
				switch( scr_3d_array_get( ship_grid, i, j, ship_type ) )
				{
					case sh_none:
						col = c_white;
						break;
				
					case sh_combat_component:
						col = c_red;
						break;
					
					case sh_truster_component:
						col = c_blue;
						break;
					
					case sh_core:
						col = c_green;
						break;
					
					default:
						col = c_black;
						break;
				}
				
				draw_grid_hull[ draw_grid_hull_index, 0 ] = col;
				draw_grid_hull[ draw_grid_hull_index, 1 ] = i;
				draw_grid_hull[ draw_grid_hull_index, 2 ] = j;
				
				draw_grid_hull_index++;
			}
		}
	}
	
	draw_grid_hull_active = true;
	draw_grid_hull_recheck = false;
}

	// recheck the object && turret draw grid && hackable_parts_list
if( draw_grid_object_recheck )
{
	// update the hackable_parts_list
	ds_list_clear(hackable_parts_list);
	
	var obj;
	
	part_count = 0;
	
	draw_grid_object_index = 0;
	draw_grid_turret_index = 0;
	
	for( var i = 0; i < ship_grid_width; i++)
	{
		for( var j = 0; j < ship_grid_height; j++ )
		{
			if( scr_3d_array_get( ship_grid, i, j, ship_valid ) )
			{
				obj = scr_3d_array_get( ship_grid, i, j, ship_object );
				if( instance_exists( obj ) )
				{
					if( sprite_exists( obj.sprite_index ) )
					{
						if(scr_3d_array_get( ship_grid, i, j, ship_type ) != sh_combat_component )
						{
								// object	
							draw_grid_object[draw_grid_object_index, 0] = obj;
							draw_grid_object[draw_grid_object_index, 1] = i;
							draw_grid_object[draw_grid_object_index, 2] = j;
					
							draw_grid_object_index++;
						}
						else
						{
								// turret
							draw_grid_turret[draw_grid_turret_index, 0] = obj;
							draw_grid_turret[draw_grid_turret_index, 1] = i;
							draw_grid_turret[draw_grid_turret_index, 2] = j;
					
							draw_grid_turret_index++;
						}
						
						// add object to list of hackable parts?
						if( obj.type >= 0 && obj.type < 3 )
							ds_list_add( hackable_parts_list, obj );
					}
				}
			}
		}
	}
	
	draw_grid_object_recheck = false;
	draw_grid_object_active = true;
}
