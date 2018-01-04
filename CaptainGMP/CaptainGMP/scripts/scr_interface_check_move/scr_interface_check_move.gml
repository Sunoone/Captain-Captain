/// @description scr_interface_check_move( interface_index, id, ring, pos )
/// @param interface_index
/// @param id
/// @param ring
/// @param pos


// this script checks if an interface element can be moved to the given location

/*

globalvar owned_interface

var int, grid, obj, obj_width, pos, max_grid, free, type, obj_type;

int = owned_interface[ argument0 ];
obj = argument1;
obj_width = obj.interface_width;
grid = int.ring[ argument2, 0 ];
max_grid = int.grid_width;
pos = argument3;

obj_type = object_get_parent( obj.object_index );

var j, t;
for( var k = pos; k < pos + obj_width; k++ )
{
	j = k mod max_grid;
	
	// check if the grid is free
	if( grid[# j, free ] == false )
	{
		return false;
	}
	
	// check if the object type is compatiable
	t = grid[# j, type ];
	if( t >= 0 )
	{
		if( t != obj_type )
		{
			return false;
		}
	}
}

return true;