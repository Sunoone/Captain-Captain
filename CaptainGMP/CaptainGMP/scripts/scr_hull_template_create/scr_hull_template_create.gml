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
			// resize the 3d array to the needed size + 2 (buffer)
			var x_max, y_max;
			x_max = 11;
			y_max = 10;
			
			scr_3d_array_resize( ship_grid, x_max + 1, y_max + 1, 3 );
			
				// set grid to standard values
			scr_3d_array_set_region( ship_grid, 0, 0, ship_valid, x_max, y_max, ship_valid, false );
			scr_3d_array_set_region( ship_grid, 0, 0, ship_type, x_max, y_max, ship_type, sh_none );
			scr_3d_array_set_region( ship_grid, 0, 0, ship_object, x_max, y_max, ship_object, -1 );
						
				// row, collom
			var r, c; 
			r = 1; c = 1;
			
				// set valid
			r = 1;
			repeat(3) { scr_3d_array_set( ship_grid, r,c, ship_valid, true ); r++; }
			c++; r = 2;
			repeat(3) { scr_3d_array_set( ship_grid, r,c, ship_valid, true ); r++; }
			c++; r = 3;
			repeat(3) { scr_3d_array_set( ship_grid, r,c, ship_valid, true ); r++; }
			c++; r = 3;
			repeat(5) { scr_3d_array_set( ship_grid, r,c, ship_valid, true ); r++; }
			c++; r = 3;
			repeat(8) { scr_3d_array_set( ship_grid, r,c, ship_valid, true ); r++; }
			c++; r = 3;
			repeat(5) { scr_3d_array_set( ship_grid, r,c, ship_valid, true ); r++; }
			c++; r = 3;
			repeat(3) { scr_3d_array_set( ship_grid, r,c, ship_valid, true ); r++; }
			c++; r = 2;
			repeat(3) { scr_3d_array_set( ship_grid, r,c, ship_valid, true ); r++; }
			c++; r = 1;
			repeat(3) { scr_3d_array_set( ship_grid, r,c, ship_valid, true ); r++; }
			
			// restrict grid types & create objects
			
				// core
			r = 5; c= 5;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_core );
			
				// turrets
			r = 3; c = 2;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_combat_component );
			
			r = 4; c = 4;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_combat_component );
			
			r = 6; c = 5;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_combat_component );
			
			r = 9; c = 5;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_combat_component );
			
			r = 4; c = 6;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_combat_component );
			
			r = 3; c = 8;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_combat_component );
			
			
				// trusters
			r = 2; c = 1;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_truster_component );
			
			r = 3; c = 3;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_truster_component );
			
			r = 7; c = 4;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_truster_component );
			
			r = 3; c = 5;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_truster_component );
			
			r = 7; c = 6;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_truster_component );
			
			r = 3; c = 7;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_truster_component );
			
			r = 2; c = 9;
			scr_3d_array_set( ship_grid, r, c, ship_type, sh_truster_component );
		}		
	}
	break;
	
	default:
		show_error( "scr_hull_template_create: Hull template does not exists.", true );
	break;	
}

	// adjust internal variables based on the new ship_grid dimentions
with(obj)
{
	ship_grid_width = scr_3d_array_width(ship_grid);
	ship_grid_height = scr_3d_array_height(ship_grid);
	
	draw_grid_hull_recheck = true;
	
	if( surface_exists( object_surface ) ) surface_resize( object_surface, ship_grid_size + ship_grid_width * ship_grid_size, ship_grid_height * ship_grid_size );
	else object_surface = surface_create( ship_grid_size + ship_grid_width * ship_grid_size, ship_grid_height * ship_grid_size );
}