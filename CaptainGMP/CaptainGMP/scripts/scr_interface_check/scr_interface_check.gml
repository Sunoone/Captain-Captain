/// @description scr_interface_check( interface_index, id, ring, pos1, opt:pos2 )
/// @param interface_index
/// @param id
/// @param ring
/// @param pos1
/// @param opt:pos2

// this script checks if an interface element can be placed at the given location
// pos2 argument is used for the origin location when moving an object within the interface

globalvar owned_interface;

var type, int, obj, grid, pos, obj_width, obj_type, pos2, k, grid_max;
int = owned_interface[ argument[0] ];
obj = argument[1];
type = argument[2];
pos = argument[3];

if( argument_count = 5 ) pos2 = argument[4];
else pos2 = -4;

if( type < 0 || type >= int.max_rings ) return false;
if( pos < 0 || pos >= int.grid_width ) return false;

grid = int.ring[ type, 0 ];
grid_max = int.grid_width;
obj_width = obj.interface_width;
obj_type = object_get_parent(obj.object_index);

//check position
for( var j = pos; j < pos + obj_width; j++ )
{
	k = j mod grid_max;
	
	// check if the space is free
	if( grid[# k, g_free] == false )
	{
		if( pos2 >= 0 )
		{
			// special case: wrap-around
			var pos3, k_max;
			
			k_max = k;
			pos3 = (pos2 + obj_width - 1) mod grid_max;
			
			if( pos3 < pos2)
			{
				pos3 += grid_max;
				if( k_max < pos2 ) k_max += grid_max;
			}
			
			if( k_max < pos2 || k_max > pos3 )
			{
				return false;
			}
		}
		else return false;
	}
	
	// check if the allowed type is correct
	/*
	if( grid[# k, g_type] != obj_type )
	{
		if( grid[# k, g_type] >= 0 ) return false;
	}
	*/
}

return true;