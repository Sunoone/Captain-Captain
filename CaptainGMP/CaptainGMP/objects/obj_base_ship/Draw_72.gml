/// @description Combat Draw
// The draw code for ships

	// probably more efficient to keep a list with objects to draw

if( surface_exists( object_surface ) == false ) object_surface = surface_create( ship_grid_width * ship_grid_size, ship_grid_height * ship_grid_size );


surface_set_target( object_surface );

draw_clear_alpha( c_black, 0 );

var d_pos_off;
d_pos_off = ship_grid_size * 0.5;

//draw ship bottom
if( sprite_exists( ship_sprite ) )
{
	draw_sprite_ext( ship_sprite, 1, d_pos_off + ship_sprite_hallign * ship_grid_size, d_pos_off + ship_sprite_vallign * ship_grid_size, 1, 1, 0, c_white, 1 );	
}

// draw grids with stored data

//draw hulls
if( draw_grid_hull_active && draw_top == false)
{
	for( var i = 0; i < draw_grid_hull_index; i++)
	{
		draw_sprite_ext( spr_hull, 0, d_pos_off + draw_grid_hull[i,1] * ship_grid_size,  d_pos_off + draw_grid_hull[i,2] * ship_grid_size, 1, 1, 0, draw_grid_hull[i,0], 1 );
	}
}


//draw objects, ship top & turrets
if( draw_grid_object_active )
{
	var obj;
	
	for( var i = 0; i < draw_grid_object_index; i++)
	{
		obj = draw_grid_object[i,0];
		
		draw_sprite_ext( obj.sprite_index, floor(obj.animation_count),  d_pos_off + draw_grid_object[i,1] * ship_grid_size,  d_pos_off + draw_grid_object[i,2] * ship_grid_size, 1, 1, obj.direction - direction, c_white, 1 );
	}
	
	if( sprite_exists( ship_sprite ) && draw_top )
	{
		draw_sprite_ext( ship_sprite, 0, d_pos_off + ship_sprite_hallign * ship_grid_size, d_pos_off + ship_sprite_vallign * ship_grid_size, 1, 1, 0, c_white, 1 );	
	}
	
	for( var i = 0; i < draw_grid_turret_index; i++)
	{
		obj = draw_grid_turret[i,0];
		
		draw_sprite_ext( obj.sprite_index, floor(obj.animation_count), d_pos_off + draw_grid_turret[i,1] * ship_grid_size, d_pos_off + draw_grid_turret[i,2] * ship_grid_size, 1, 1, obj.direction - direction, c_white, 1 );
	}
}
surface_reset_target();
