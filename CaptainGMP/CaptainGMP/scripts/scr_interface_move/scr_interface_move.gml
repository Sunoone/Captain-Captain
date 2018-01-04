/// @description scr_interface_move( interface_index, ring, pos1, pos2 )
/// @param interface_index
/// @param ring
/// @param pos1
/// @param pos2


// this script checks if an interface element can be moved to the given location

globalvar owned_interface

var int, type, grid, obj, obj_width, pos1, pos2, max_grid, obj_type;

int = owned_interface[ argument0 ];
type = argument1;
grid = int.ring[ type, 0 ];
pos1 = argument2;
pos2 = argument3;

max_grid = int.grid_width;

obj = grid[# pos1, int.e_id];
obj_type = object_get_parent( obj.object_index );
obj_width = obj.interface_width;

var g_free, g_type;
g_free = int.g_free;
g_type = int.g_type;

// reserve space
for( var j = 0; j < obj_width; j++ )
{
	grid[# pos2 + j, free] = false;
}

// parent underlying spaces or forbid them
var tmp_grid, obj_allowed_list;

obj_allowed_list = obj.allowed_type;

for( var i = type + 1; i<int.max_rings; i++ )
{
	tmp_grid = int.ring[ i, 0 ];
	
	for( var j = 0; j < obj_width; j++ )
	{
		ds_grid_set( tmp_grid, pos2 + j, int.g_parent, obj );
		
		if( ds_list_size(obj_allowed_list) > 0 )
		{
			ds_grid_set( tmp_grid, pos2 + j, g_free, true );
			ds_grid_set( tmp_grid, pos2 + j, g_type, obj_allowed_list[|0] );
		}
		else
		{
			ds_grid_set( tmp_grid, pos2 + j, g_free, false );
			ds_grid_set( tmp_grid, pos2 + j, g_type, -4 );
		}
	}
}

// if free, forbid space above element
if( grid[# pos2, int.g_parent ] < 0 )
{
	for( var i = type; i >= 0; i-- )
	{
		tmp_grid = int.ring[ i, 0 ];
		
		for( var j = 0; j < obj_width; j++ )
		{
			ds_grid_set( tmp_grid, pos2 + j, g_free, false );
		}
	}
}

// calculate pos
var ele_x, ele_y, ele_rot, r_rot, p_len, p;

p = grid[# pos2, int.g_parent];

r_rot = 360 / int.grid_width;
p_len = (int.rad_0*0.5) - (int.r_dist*0.5) + (int.r_dist*type);

ele_rot = r_rot * (pos2 - 0.5 + 0.5 * obj_width);
ele_x = int.s_width + lengthdir_x( p_len, ele_rot );
ele_y = int.s_height + lengthdir_y( p_len, ele_rot );

// declare vars
grid[# pos2, int.e_id ] = obj;
grid[# pos2, int.e_spr ] = obj.sprite_index;
grid[# pos2, int.e_link ] = p;
grid[# pos2, int.e_x ] = ele_x;
grid[# pos2, int.e_y ] = ele_y;
grid[# pos2, int.e_width ] = obj_width;

if( instance_exists( p ) )
{
	ds_list_add( p.children, obj );
}

// if there are elements below this object, parent them

// cleanup


return true;