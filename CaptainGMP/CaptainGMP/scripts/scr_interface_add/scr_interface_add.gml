/// @description scr_interface_add( interface_index, id, type, pos )
/// @param interface_index
/// @param id
/// @param type
/// @param pos

// this script add an interface element to the given location

globalvar owned_interface

var int, type, obj, pos;

int = owned_interface[ argument0 ];	// interface id referance
obj = argument1;	// object id
type = argument2;	// combat object type
pos = argument3;	// position on the ring


var grid, max_grid, obj_width, obj_type, obj_allowed_list;

grid = int.ring[ type, 0 ];
max_grid = int.grid_width;

obj_type = object_get_parent( obj.object_index );
obj_width = obj.interface_width;
obj_allowed_list = obj.allowed_type;

// common loop vars
var k, tmp_grid, child;

// reserve space for object_width
for( var j = pos; j < pos + obj_width; j++ )
{
	k = j mod max_grid;
	grid[# k, g_free] = false;
}

// parent underlying spaces & objects or forbid them
if( type + 1 < int.max_rings )
{
	tmp_grid = int.ring[ type + 1, 0 ];
	
	for( var j = pos; j < pos + obj_width; j++ )
	{
		k = j mod max_grid;
		
		ds_grid_set( tmp_grid, k, g_parent, obj );
		
		if( ds_list_size(obj_allowed_list) > 0 )
		{
			// parent underlying space
			ds_grid_set( tmp_grid, k, g_free, true );
			ds_grid_set( tmp_grid, k, g_type, obj_allowed_list[|0] );
		}
		else
		{
			// forbid underlying space
			ds_grid_set( tmp_grid, k, g_free, false );
			ds_grid_set( tmp_grid, k, g_type, -4 );
		}
		
		// add child
		child = tmp_grid[# k, e_id];
		if( instance_exists( child ) && object_get_parent( child.object_index ) == obj_allowed_list[|0] )
		{
			scr_ds_list_add_unique( obj.children , child );
			tmp_grid[# k, e_link] = obj;
		}
	}
}

// calculate pos
var ele_x, ele_y, ele_rot, r_rot, p_len, p;

p = grid[# pos, g_parent];

r_rot = 360 / max_grid;
p_len = (int.rad_0 * 0.5) - (int.r_dist * 0.5) + (int.r_dist * type);

ele_rot = r_rot * (pos - 0.5 + 0.5 * obj_width);
ele_x = int.s_width + lengthdir_x( p_len, ele_rot );
ele_y = int.s_height + lengthdir_y( p_len, ele_rot );

// declare vars
grid[# pos, e_id ] = obj;
grid[# pos, e_rot ] = ele_rot;
grid[# pos, e_spr ] = obj.sprite_index;
grid[# pos, e_link ] = p;
grid[# pos, e_x ] = ele_x;
grid[# pos, e_y ] = ele_y;
grid[# pos, e_width ] = obj_width;

// parent object
if( instance_exists( p ) )
{
	scr_ds_list_add_unique( p.children, obj );
}

