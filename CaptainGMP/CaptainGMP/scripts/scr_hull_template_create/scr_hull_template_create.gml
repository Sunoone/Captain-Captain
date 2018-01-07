/// @description scr_hull_template_create( obj, template )
/// @param obj
/// @param template

// this script creates a predefined hull template
	// We need to build an editor for this that has a save and load fuction
var obj;

obj = argument0;
if( instance_exists( obj ) == false ) show_error( "scr_hull_template_create: Provided object does not exists.", true );

// Keep in mind to declare Hull templates to the right, as that is 0 deg for GM
switch( argument1 )
{
	case 0:
	{
		// Hull Template 'Small Ship'
		with(obj)
		{
			for( var i = 0; i < 3; i++ )
			{
				ds_grid_resize( ship_grid[i], 11, 12 );
			}
			
				// set grid to standard values
			ds_grid_set_region( ship_grid[ship_valid], 0,0, 10,11, false );
			ds_grid_set_region( ship_grid[ship_type], 0,0, 10,11, 0 );
			ds_grid_set_region( ship_grid[ship_object], 0,0, 10,11, -1 );
			
			var ship_grid_obj = ship_grid[ship_object];
			
				// row, collom
			var r, c; 
			c = 1; c = 1;
			
				// set valid
			r = 1;
			repeat(3) { ds_grid_set( ship_grid[ship_valid], r,c, true ); r++; }
			c++; r = 2;
			repeat(3) { ds_grid_set( ship_grid[ship_valid], r,c, true ); r++; }
			c++; r = 3;
			repeat(3) { ds_grid_set( ship_grid[ship_valid], r,c, true ); r++; }
			c++; r = 3;
			repeat(5) { ds_grid_set( ship_grid[ship_valid], r,c, true ); r++; }
			c++; r = 3;
			repeat(8) { ds_grid_set( ship_grid[ship_valid], r,c, true ); r++; }
			c++; r = 3;
			repeat(5) { ds_grid_set( ship_grid[ship_valid], r,c, true ); r++; }
			c++; r = 3;
			repeat(3) { ds_grid_set( ship_grid[ship_valid], r,c, true ); r++; }
			c++; r = 2;
			repeat(3) { ds_grid_set( ship_grid[ship_valid], r,c, true ); r++; }
			r = 1;
			repeat(3) { ds_grid_set( ship_grid[ship_valid], r,c, true ); r++; }
			
			// restrict grid types & create objects
			
				// core
			r = 5; c= 5;
			ds_grid_set( ship_grid[ship_type], r, c, sh_core );
			ship_grid_obj[# r, c] = scr_create_object( obj_core, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj ); //create core
			
			
				// turrets
			r = 3; c = 2;
			ds_grid_set( ship_grid[ship_type], r, c, sh_combat_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_turret_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj ); //create turret
			
			r = 4; c = 3;
			ds_grid_set( ship_grid[ship_type], r, c, sh_combat_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_turret_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj ); //create turret
			
			r = 6; c = 5;
			ds_grid_set( ship_grid[ship_type], r, c, sh_combat_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_turret_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj ); //create turret
			
			r = 10; c = 5;
			ds_grid_set( ship_grid[ship_type], r, c, sh_combat_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_turret_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj ); //create turret
			
			r = 4; c = 6;
			ds_grid_set( ship_grid[ship_type], r, c, sh_combat_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_turret_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj ); //create turret
			
			r = 3; c = 8;
			ds_grid_set( ship_grid[ship_type], r, c, sh_combat_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_turret_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj ); //create turret
			
			
				// trusters
			r = 2; c = 1;
			ds_grid_set( ship_grid[ship_type], 2, 1, sh_truster_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_truster_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj, 270 ); //create truster
			
			r = 3; c = 3;
			ds_grid_set( ship_grid[ship_type], 3, 3, sh_truster_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_truster_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj, 180 ); //create truster
			
			r = 7; c = 4;
			ds_grid_set( ship_grid[ship_type], 7, 4, sh_truster_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_truster_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj ); //create truster
			
			r = 3; c = 5;
			ds_grid_set( ship_grid[ship_type], 3, 5, sh_truster_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_truster_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj, 180 ); //create truster
			
			r = 7; c = 6;
			ds_grid_set( ship_grid[ship_type], 7, 6, sh_truster_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_truster_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj ); //create truster
			
			r = 3; c = 7;
			ds_grid_set( ship_grid[ship_type], 3, 7, sh_truster_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_truster_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj, 180 ); //create truster
			
			r = 2; c = 9;
			ds_grid_set( ship_grid[ship_type], 2, 9, sh_truster_component );
			ship_grid_obj[# r, c] = scr_create_object( obj_truster_1, obj.owner, (r * -0.5 + 5) * ship_grid_size, (c * -0.5 + 5), 0, obj, 90 ); //create truster
		}		
	}
	break;
	
	default:
		show_error( "scr_hull_template_create: Hull template does not exists.", true );
	break;	
}