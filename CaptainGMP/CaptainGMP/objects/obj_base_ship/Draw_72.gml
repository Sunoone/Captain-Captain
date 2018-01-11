/// @description Combat Draw
// The draw code for ships

	// probably more efficient to keep a list with objects to draw

if( surface_exists( object_surface ) == false ) object_surface = surface_create( ship_grid_width * ship_grid_size, ship_grid_height * ship_grid_size );


surface_set_target( object_surface );

draw_clear_alpha( c_black, 0 );

var d_pos_off;
d_pos_off = ship_grid_size * 0.5;
//d_pos_off = 0;

//draw ship bottom
if( sprite_exists( ship_sprite ) )
{
	draw_sprite_ext( ship_sprite, 1, d_pos_off + ship_hallign * ship_grid_size, d_pos_off + ship_vallign * ship_grid_size, 1, 1, 0, c_white, 1 );	
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
		if( instance_exists(obj) )
			draw_sprite_ext( obj.sprite_index, floor(obj.animation_count),  d_pos_off + draw_grid_object[i,1] * ship_grid_size,  d_pos_off + draw_grid_object[i,2] * ship_grid_size, 1, 1, obj.direction - direction, c_white, 1 );
	}
	
	if( sprite_exists( ship_sprite ) && draw_top )
	{
		draw_sprite_ext( ship_sprite, 0, d_pos_off + ship_hallign * ship_grid_size, d_pos_off + ship_vallign * ship_grid_size, 1, 1, 0, c_white, 1 );	
	}
	
	for( var i = 0; i < draw_grid_turret_index; i++)
	{
		obj = draw_grid_turret[i,0];
		if( instance_exists(obj) )
			draw_sprite_ext( obj.sprite_index, floor(obj.animation_count), d_pos_off + draw_grid_turret[i,1] * ship_grid_size, d_pos_off + draw_grid_turret[i,2] * ship_grid_size, 1, 1, obj.direction - direction, c_white, 1 );
	}
}


/*
// debug draw grid
for( var i = 0; i <= ship_grid_width; i++)
{
	for( var j = 0; j <= ship_grid_height; j++ )
	{
		draw_line_color( i * ship_grid_size, 0, i * ship_grid_size, j * ship_grid_size, c_green, c_green );
		draw_line_color( 0, j * ship_grid_size, i * ship_grid_size, j * ship_grid_size, c_green, c_green );
	}
}

// debug draw surface size
var s_h, s_w;

s_w = surface_get_width( object_surface ) - 2;
s_h = surface_get_height( object_surface ) - 2;

draw_rectangle_color( 1,1, s_w,s_h, c_white,c_white,c_white,c_white,true );
*/

// reset the draw target
surface_reset_target();




// draw ship
var combat_screen = global.combat_screen;

if( surface_exists( combat_screen ) )
{
	surface_set_target( combat_screen );
	
	// fix rotation on center point
	var XX, YY, rotate_x, rotate_y, h_width, h_height, inherent_direction;
		
	
	//choose centerpoint based on sprite allignment
	h_width = ship_hallign * ship_grid_size;
	h_height = ship_vallign * ship_grid_size;
	
	var len = sqrt( sqr(h_width) + sqr(h_height) );
	var dir = point_direction(0,0,h_width,h_height);
	
	inherent_direction = direction;
	
	rotate_x = lengthdir_x(len, inherent_direction + dir);
	rotate_y = lengthdir_y(len, inherent_direction + dir);
	
	XX = x - h_width + (h_width - rotate_x);
	YY = y - h_height + (h_height - rotate_y);
	
	// draw surface with offset for rotation
	
	draw_surface_ext( object_surface, XX, YY, 1, 1, inherent_direction, c_white, 1 );
	
	// debug -----------------------------------------------------------------------------------------------------------------------------------------------
	/*
	draw_circle_color( x, y, 2, c_red, c_red, false);
	
	var x1, x2, y1, y2, rad;
	x1 = ship_hallign * ship_grid_size;
	y1 = ship_vallign * ship_grid_size;
	x2 = ship_grid_width * ship_grid_size - x1;
	y2 = ship_grid_height * ship_grid_size - y1;
	
	rad = round(max( point_distance(0,0,x1,y1), point_distance(0,0,x1,y2), point_distance(0,0,x2,y1), point_distance(0,0,x2,y2) ));	//rad
	
	draw_circle_color( x, y, rad, c_green, c_green, true );
	*/
	// debug -----------------------------------------------------------------------------------------------------------------------------------------------
	
	surface_reset_target();
}