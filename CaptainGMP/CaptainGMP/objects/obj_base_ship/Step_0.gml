/// @description update draw grids

	// recheck the hull draw grid 
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

	// recheck the object && turret draw grid
if( draw_grid_object_recheck )
{
	var obj;
	
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
					}
				}
			}
		}
	}
	
	draw_grid_object_recheck = false;
	draw_grid_object_active = true;
}
