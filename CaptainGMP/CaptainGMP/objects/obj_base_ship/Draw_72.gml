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
		{
			var col = c_white;
			if(obj.owner != obj.original_owner) col = c_dkgray;
			
			draw_sprite_ext( obj.sprite_index, floor(obj.animation_count),  d_pos_off + draw_grid_object[i,1] * ship_grid_size,  d_pos_off + draw_grid_object[i,2] * ship_grid_size, 1, 1, obj.direction - direction, col, 1 );
			if( obj.light_up > 0 ) draw_sprite_ext( spr_hull, 0,  d_pos_off + draw_grid_object[i,1] * ship_grid_size,  d_pos_off + draw_grid_object[i,2] * ship_grid_size, 1.1, 1.1, obj.direction - direction, c_yellow, 0.5 );
		}
	}
	
	if( sprite_exists( ship_sprite ) && draw_top )
	{
		draw_sprite_ext( ship_sprite, 0, d_pos_off + ship_hallign * ship_grid_size, d_pos_off + ship_vallign * ship_grid_size, 1, 1, 0, c_white, 1 );	
	}
	
	for( var i = 0; i < draw_grid_turret_index; i++)
	{
		obj = draw_grid_turret[i,0];
		if( instance_exists(obj) )
		{
			var col = c_white;
			if(obj.owner != obj.original_owner) col = c_dkgray;
			
			draw_sprite_ext( obj.sprite_index, floor(obj.animation_count), d_pos_off + draw_grid_turret[i,1] * ship_grid_size, d_pos_off + draw_grid_turret[i,2] * ship_grid_size, 1, 1, obj.direction - direction, col, 1 );
			if( obj.light_up > 0 ) draw_sprite_ext( spr_hull, 0, d_pos_off + draw_grid_turret[i,1] * ship_grid_size, d_pos_off + draw_grid_turret[i,2] * ship_grid_size, 1.1, 1.1, obj.direction - direction, c_yellow, 0.5 );
		}
	}
}

// DEBUG
/*
var d_x1, d_y1, d_x2, d_y2, d_x3, d_y3;

d_x1 = 1;
d_y1 = 1;
d_x2 = surface_get_width(object_surface)-2;
d_y2 = surface_get_height(object_surface)-2;

draw_rectangle_color( d_x1,d_y1,d_x2, d_y2,c_red, c_red,c_red,c_red,true );
draw_line_colour( d_x1,d_y1,d_x2, d_y2 ,c_red, c_red);
draw_line_colour( d_x2,d_y1,d_x1, d_y2 ,c_red, c_red);

d_x3 = ((ship_hallign + ship_hallign_off) * ship_grid_size);
d_y3 = ((ship_vallign + ship_vallign_off) * ship_grid_size);

draw_line_colour( d_x3+100,d_y3,d_x3-100, d_y3 ,c_blue, c_blue);
draw_line_colour( d_x3,d_y3+100,d_x3, d_y3-100 ,c_blue, c_blue);
*/
// reset the draw target
surface_reset_target();




// draw ship --------------------------------------------------------------
var h_width, h_height, l_l, l_d, l_x, l_y;

h_width = surface_get_width(object_surface) * 0.5 - ((ship_hallign + ship_hallign_off) * ship_grid_size);
h_height = surface_get_height(object_surface) * 0.5 - ((ship_vallign + ship_vallign_off) * ship_grid_size);

l_l = pyt( h_width, h_height );
l_d = (direction - point_direction( 0,0,h_width,h_height )) mod 360;

l_x = lengthdir_x( l_l, l_d );
l_y = lengthdir_y( l_l, l_d );

scr_camera_draw_surface( global.combat_camera, object_surface, x + l_x, y + l_y, direction );
/*
var combat_screen = global.combat_screen;

if( surface_exists( combat_screen ) )
{
	surface_set_target( combat_screen );
	
	// fix rotation on center point
	var XX, YY, rotate_x, rotate_y, h_width, h_height, inherent_direction;
		
	
	//choose centerpoint based on sprite allignment
	h_width = (ship_hallign + ship_hallign_off) * ship_grid_size;
	h_height = (ship_vallign + ship_vallign_off) * ship_grid_size;
	
	var len = sqrt( sqr(h_width) + sqr(h_height) );
	var dir = point_direction(0,0,h_width,h_height);
	
	inherent_direction = direction;
	
	rotate_x = lengthdir_x(len, inherent_direction + dir);
	rotate_y = lengthdir_y(len, inherent_direction + dir);
	
	XX = x - h_width + (h_width - rotate_x);
	YY = y - h_height + (h_height - rotate_y);
	
	// draw surface with offset for rotation
	
	draw_surface_ext( object_surface, XX, YY, 1, 1, inherent_direction, c_white, 1 );
	
	surface_reset_target();
}