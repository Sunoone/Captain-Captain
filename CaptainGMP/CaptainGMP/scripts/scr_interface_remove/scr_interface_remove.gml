/// @description scr_interface_remove( interface_index, type, pos )
/// @param interface_index
/// @param type
/// @param pos


// this script removes the element from the given interface

globalvar owned_interface

var int, type, obj, pos;

int = owned_interface[ argument0 ];	// interface id referance
type = argument1;	// combat object type
pos = argument2;	// position on the ring


var grid, max_grid, obj, obj_width, obj_type, parent;

grid = int.ring[ type, 0 ];
max_grid = int.grid_width;

obj = grid[# pos, e_id]; // object id
obj_type = object_get_parent( obj.object_index );
obj_width = obj.interface_width;

parent = grid[# pos, e_link]; // object id

// common loop vars
var k, tmp_grid, child;

// free space under object_width
for( var j = pos; j < pos + obj_width; j++ )
{
	k = j mod max_grid;
	grid[# k, g_free] = true;
}

// un-parent underlying spaces & objects and unforbid them
if( type + 1 < int.max_rings )
{
	tmp_grid = int.ring[ type + 1, 0 ];
	
	for( var j = pos; j < pos + obj_width; j++ )
	{
		k = j mod max_grid;
		
		ds_grid_set( tmp_grid, k, g_parent, -4 );
		
		// remove children
		child = tmp_grid[# k, e_id];
		tmp_grid[# k, e_link] = -4;
		if( instance_exists( child ) )
		{
			scr_ds_list_remove_value( obj.children , child );
		}
	}
}

// calculate pos
var ele_x, ele_y, ele_rot, r_rot, p_len, p;

p = parent;

// declare vars
grid[# pos, e_id ] = -4;
grid[# pos, e_rot ] = -4;
grid[# pos, e_spr ] = -4;
grid[# pos, e_link ] = -4;
grid[# pos, e_x ] = -4;
grid[# pos, e_y ] = -4;
grid[# pos, e_width ] = -4;

if( instance_exists( p ) )
{
	scr_ds_list_remove_value( p.children, obj );
}