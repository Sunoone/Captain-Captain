/// @description scr_projectile_check_collision( owner, x1, y1, x2, y2, opt:accuracy )
/// @param owner
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param opt:accuracy

// this script checks collision on points on a line, then returns the first object along the line belonging to another owner than the given one

// the optional argument accuracy adjust the distance between points on the line that get checked
	// if accuracy <= 1 then the collision check will happen per pixel

	// safety check
if( argument_count < 5 || argument_count > 6 ) show_error("scr_check_collision_line argument count is incorrect", true);

var dis, acc, len, own;

len = point_distance( argument[1], argument[2], argument[3], argument[4] );
if(len <= 0) len = 1;
dir = point_direction( argument[1], argument[2], argument[3], argument[4] );
own = argument[0];

// accuracy
if( argument_count == 6 ) acc = argument[5];
else acc = 4; // standard accuracy

if( acc < 1 )	// pixel perfect collision checking
{
	acc = 1;
}

var p_x, p_y, collision_object, obj, x_adj, y_adj, value_found;

collision_object = -1;

p_x = argument[1];
p_y = argument[2];

x_adj = lengthdir_x( acc, dir );
y_adj = lengthdir_y( acc, dir );

// the collision check, might be more optimized to do a collision line before to check if there will be any results
for( var i = 0; i < len; i += acc )
{
	obj = collision_point( p_x, p_y, obj_base_combat, false, false );
	
	if( obj != noone )
	{
		if( obj.owner != own )
		{
			collision_object = obj;
			break;
		}
	}
	
	p_x += x_adj;
	p_y += y_adj;
}

return collision_object;