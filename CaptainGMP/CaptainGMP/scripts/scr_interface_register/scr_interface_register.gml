/// @description scr_interface_register( interface_index , combat_object, type)
/// @param interface_index
/// @param combat_object
/// @param type

// This script registers an new interface element with the interface controler
if(argument2 < 0) return true;

globalvar owned_interface;

var type, int, obj, grid, pos, obj_width, obj_type, free;
int = owned_interface[ argument0 ];
obj = argument1;
type = argument2;

grid = int.ring[ type, 0 ];
obj_width = obj.interface_width;
obj_type = object_get_parent(obj.object_index);

free = false;

pos = -1;

// find a position
var p, w, c;

if( type != 0)
{
	w = 0;
	p = -4;
	c = -1;
	
	// loop trough grid in search of a position with an parent that accepts the object type
	for( var k = 0; k < int.grid_width + obj_width; k++)
	{
		var j = k;
		if (j >= int.grid_width) j -= int.grid_width
		
		if( grid[# j, g_free ] == true )
		{
			var par = grid[# j, g_parent ];
			
			if( instance_exists(par) )
			{
				if( scr_ds_list_value_exist( par.allowed_type, obj_type ) )
				{
					if( par == p ) w += 1;
					else
					{
						w = 1;
						c = j;
						p = par;
					}
				}
			}
		}
		else
		{
			w = 0; 
			p = -4;
			c = -1;
		}
		
		if( w == obj_width )
		{
			pos = c;
			break;
		}
	}
}

// find free space
if( pos == -1 )
{
	w = 0;
	c = -1;
	p = -4;
	free = true;
	
	// loop trough grid in search of a free position
	for( var k = 0; k < int.grid_width + obj_width; k++)
	{
		var j = k;
		if (j >= int.grid_width) j -= int.grid_width
		
		if( grid[# j, g_free ] == true )
		{
			var par = grid[# j, g_parent ];
			
			if( instance_exists(par) == false )
			{
				if( w = 0 )
				{
					w = 1;
					c = j;
				}
				else 
				{
					w += 1;
				}
			}
		}
		else
		{
			w = 0; 
			c = -1;
		}
		
		if( w == obj_width )
		{
			pos = c;
			break;
		}
	}
}

// there is no space for the object
if( pos == -1 ) return false;

scr_interface_add( argument0, obj, type, pos );

return true;