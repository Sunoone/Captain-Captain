/// @description scr_interface_register(interface, combat_object, type)
/// @param interface
/// @param combat_object
/// @param type

// This script registers an new interface element with the interface controler
if(argument2 < 0) return true;

var type, int, obj, grid, pos, obj_width, obj_type, free;
int = argument0;
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
	for( var j = 0; j < int.grid_width; j++)
	{
		if( grid[# j, int.g_free ] == true )
		{
			if( grid[# j, int.g_type ] == obj_type )
			{
				var par = grid[# j, int.g_parent ];
				
				if( instance_exists(par) )
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
	for( var j = 0; j < int.grid_width; j++)
	{
		if( grid[# j, int.g_free ] == true )
		{
			if( grid[# j, int.g_type ] == -4 )
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


// reserve space
for( var j = 0; j < obj_width; j++ )
{
	grid[# pos + j, int.g_free] = false;
}

// parent underlying spaces or forbid them
for( var i = type + 1; i<int.max_rings; i++ )
{
	for( var j = 0; j < obj_width; j++ )
	{
		ds_grid_set( int.ring[ i, 0 ], pos + j, int.g_parent, obj );
		
		var obj_allowed_list = obj.allowed_type;
		
		if( ds_list_size(obj_allowed_list) > 0 )
		{
			ds_grid_set( int.ring[ i, 0 ], pos + j, int.g_free, true );
			ds_grid_set( int.ring[ i, 0 ], pos + j, int.g_type, obj_allowed_list[|0] );
		}
		else
		{
			ds_grid_set( int.ring[ i, 0 ], pos + j, int.g_free, false );
			ds_grid_set( int.ring[ i, 0 ], pos + j, int.g_type, -4 );
		}
	}
}

// if free, forbid space above element
if( free )
{
	for( var i = type; i >= 0; i-- )
	{
		for( var j = 0; j < obj_width; j++ )
		{
			ds_grid_set( int.ring[ i, 0 ], pos + j, int.g_free, false );
		}
	}
}

// calculate pos
var ele_x, ele_y, ele_rot, r_rot, p_len;

r_rot = 360 / int.grid_width;
p_len = (int.rad_0*0.5) - (int.r_dist*0.5) + (int.r_dist*type);

ele_rot = r_rot * pos;
ele_x = int.s_width + lengthdir_x( p_len, ele_rot );
ele_y = int.s_height + lengthdir_y( p_len, ele_rot );

// declare vars
grid[# pos, int.e_id ] = obj;
grid[# pos, int.e_spr ] = obj.sprite_index;
grid[# pos, int.e_link ] = p;
grid[# pos, int.e_x ] = ele_x;
grid[# pos, int.e_y ] = ele_y;
grid[# pos, int.e_width ] = obj_width;

if( instance_exists( p ) )
{
	ds_list_add( p.children, obj );
}

return true;