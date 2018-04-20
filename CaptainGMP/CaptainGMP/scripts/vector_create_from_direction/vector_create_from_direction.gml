/// @description vector_create_from_direction(direction, length*);
/// @param direction
/// @param length* (default = 1)

if( argument_count < 1 && argument_count > 2) show_error("vector_create_from_direction.gml argument count is incorrect", true);

var length = 1;
if (argument_count == 2) 
	length = abs(argument[1]);

var vec; // x has index [0], y has index [1]
vec[0] = lengthdir_x( length, argument[0] );
vec[1] = lengthdir_y( length, argument[0] );

return vec;