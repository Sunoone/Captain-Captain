/// @description CreateVector(direction, opt: length);
/// @param direction
/// @param length (default = 1)

if( argument_count < 1 && argument_count > 2) show_error("scr_create_array argument count is incorrect", true);

var dir = degtorad(argument[0]);

var length = 1;
if (argument_count == 2) length = abs(argument[1]);

var vec; // x has index [0], y has index [1]
vec[1] = length*sin(dir);
vec[0] = length*cos(dir);

return vec;