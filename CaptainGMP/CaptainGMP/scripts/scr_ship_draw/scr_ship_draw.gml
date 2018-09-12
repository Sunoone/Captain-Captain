/// @description scr_ship_draw()

// this script draws the ship and it's components
// only call this script from obj_base_ship

var d_pos_off = ship_grid_size * 0.5; // this is a offset for the objects

// draw ship bottom -----------------------------------------------------------------------------------------------------------------------------------
if( sprite_exists( ship_sprite ) )
{
	draw_sprite_ext(ship_sprite, 
					1, 
					d_pos_off + ship_hallign * ship_grid_size, 
					d_pos_off + ship_vallign * ship_grid_size, 
					1, 
					1, 
					0, 
					c_white, 
					1 );
}

	// draw grids with stored data

// draw hulls ( empty slots ) -------------------------------------------------------------------------------------------------------------------------
if( draw_grid_hull_active && draw_top == false)
{
	for( var i = 0; i < draw_grid_hull_index; i++)
	{
		draw_sprite_ext(spr_hull, 
						0, 
						d_pos_off + draw_grid_hull[i,1] * ship_grid_size,  
						d_pos_off + draw_grid_hull[i,2] * ship_grid_size, 
						1, 
						1, 
						0, 
						draw_grid_hull[i,0], 
						1 );
	}
}

// draw objects ---------------------------------------------------------------------------------------------------------------------------------------
var obj, col;
	
for( var i = 0; i < draw_grid_object_index; i++)
{
	obj = draw_grid_object[i,0];
	if( instance_exists(obj) )
	{
		col = c_white;
		if(obj.owner != obj.original_owner) 
			col = c_red;
		if( !obj.active )
			col = c_dkgray;
			
		draw_sprite_ext(obj.sprite_index, 
						floor(obj.animation_count),  
						d_pos_off + draw_grid_object[i,1] * ship_grid_size,  
						d_pos_off + draw_grid_object[i,2] * ship_grid_size, 
						1, 
						1, 
						obj.direction - direction, 
						col, 
						1 );
	}
}


// draw ship top --------------------------------------------------------------------------------------------------------------------------------------
if( sprite_exists( ship_sprite ) && draw_top )
{
	draw_sprite_ext(ship_sprite, 
					0, 
					d_pos_off + ship_hallign * ship_grid_size, 
					d_pos_off + ship_vallign * ship_grid_size, 
					1, 
					1, 
					0, 
					c_white, 
					1 );	
}


// draw turrets ---------------------------------------------------------------------------------------------------------------------------------------
for( var i = 0; i < draw_grid_turret_index; i++)
{
	obj = draw_grid_turret[i,0];
	if( instance_exists(obj) )
	{
		col = c_white;
		if(obj.owner != obj.original_owner) 
			col = c_red;
		if( !obj.active )
			col = c_dkgray;
			
		draw_sprite_ext(obj.sprite_index, 
						floor(obj.animation_count), 
						d_pos_off + draw_grid_turret[i,1] * ship_grid_size, 
						d_pos_off + draw_grid_turret[i,2] * ship_grid_size, 
						1, 
						1, 
						obj.direction - direction, 
						col, 
						1 );
	}
}

// DEBUG object surface border -------------------------------------------------------------------------------------------------------------------------
draw_rectangle_color( 1,1,surface_get_width(object_surface)-2, surface_get_height(object_surface)-2, c_green,c_green,c_green,c_green,true );
draw_line_color( 0,surface_get_height(object_surface)*0.5,surface_get_width(object_surface),surface_get_height(object_surface)*0.5,c_green,c_green );
draw_line_color( surface_get_width(object_surface)*0.5,0,surface_get_width(object_surface)*0.5,surface_get_height(object_surface),c_green,c_green );
