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
		
		// add child
		child = tmp_grid[# k, e_id];
		if( instance_exists( child ) && scr_ds_list_value_exist( obj_allowed_list, object_get_parent( child.object_index ) ) )
		{
			//check if the full interface width of the child is under the interface width of the obj
			
			var k_min, k_max, pos3;
			
			k_min = k;
			k_max = k + child.interface_width;
			
			pos3 = (pos + obj_width) mod max_grid;
			if( pos3 < pos ) 
			{
				pos3 += max_grid;
				if( k_min < pos ) k_min += max_grid;
				if( k_max < pos ) k_max += max_grid;
			}
			
			if( k_min >= pos && k_max <= pos3 )
			{
				scr_ds_list_add_unique( obj.children , child );
				tmp_grid[# k, e_link] = obj;
			}
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
grid[# pos, e_link ] = -4;
grid[# pos, e_x ] = round(ele_x);
grid[# pos, e_y ] = round(ele_y);
grid[# pos, e_width ] = obj_width;

// parent object ---> there is an bug in this code relating to the wrap-around case, look at above code for fix
if( instance_exists( p ) && type != 0 )
{
	if( scr_ds_list_value_exist( p.allowed_type, obj_type ) )
	{
		// check if the full width of the parent extends over the full width of the object
		var p_min, p_max, temp_grid;
		temp_grid = int.ring[ type - 1, 0 ]
		
		if( ds_grid_value_exists( temp_grid, 0, e_id, ds_grid_width(temp_grid)-1, e_id, p ) )
		{
			p_min = ds_grid_value_x( temp_grid, 0, e_id, ds_grid_width(temp_grid)-1, e_id, p );
			p_max = p_min + p.interface_width;
			
			if( pos + obj_width <= p_max && pos + obj_width >= p_min )
			{
				grid[# pos, e_link ] = p;
				scr_ds_list_add_unique( p.children, obj );
			}
		}
	}
}

