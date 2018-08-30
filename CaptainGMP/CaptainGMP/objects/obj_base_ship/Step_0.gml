/// @description update 

// calculate movement, check out of bounds, draw grids, 

// Update CPU
if( instance_exists( ship_core ) )
	cpu = ship_core.cpu_available;
else
	cpu = 0;

// Movement ------------------------------------------------------------------
var vector_delta;
var dampen = stat[var_mass, 0] * global.DeltaTime;

	// add force to inertia from thrusters
for( var i = ds_list_size( movement )-1; i >= 0; i-- )
{
	vector_delta = movement[|i];
	vector_delta[0] /= dampen;
	vector_delta[1] /= dampen;
	
	inertia = vector_add( inertia, vector_delta );
}
ds_list_clear( movement );


	// add force to torque from thrusters
for( var i = ds_list_size( rotation )-1; i >= 0; i-- )
{
	torque += rotation[|i] / dampen;
}
ds_list_clear( rotation );


	// Calculate & Apply Drag
if( inertia[0] != 0 || inertia[1] != 0 || torque != 0)
{
	var velocity = point_distance(0,0,inertia[0],inertia[1]);
	var m_dir = point_direction( 0,0,inertia[0],inertia[1] ) + 180;
	
	d_dir = direction - m_dir;
	mod_dir = d_dir mod 180;
	d_dir += 180;
	m_area = abs( sin( degtorad( mod_dir ) ) );
	
	area = mix( drag_area_front, drag_area_side, m_area );
	
	drag = ( scr_calculate_drag( drag_coefficient, air_density, velocity, area ) ) / dampen;
	
	var d_v0 = lengthdir_x( drag, m_dir );
	var d_v1 = lengthdir_y( drag, m_dir );
	
	inertia[0] += d_v0;
	inertia[1] += d_v1;
	
	// torque from drag area
	if( area != drag_area_front )
	{		
		torque_drag = sin( degtorad( d_dir ) ) * (area - drag_area_front) * drag * -500 * global.DeltaTime;
		
		torque += torque_drag;
	}
	
	// Aerodynamic drag on torque
	if( torque != 0 )
	{
		//torque *= (torque - ( torque * global.DeltaTime)) / torque;
		
		aero_torque_drag = scr_calculate_drag( drag_coefficient, air_density, (-torque / dampen), drag_area_front + drag_area_side );
		
		torque *= (torque - ( torque * aero_torque_drag)) / torque;
	}
}




	// Move ship
x += inertia[0];
y += inertia[1];


	// Rotate the ship
direction += torque / dampen;

	// debug
//direction = point_direction( 1360, 540, mouse_x, mouse_y );

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


// shield system -------------------------------------------------------------------------------------------------
shield = 0;

for( var i = ds_list_size( shield_list ) - 1; i >= 0; i-- )
{
	shield += shield_list[|i].shield_buffer;
}

ds_list_clear( shield_list );