/// @description vector_create(x, y);
/// @param x
/// @param y

if( argument_count != 2) show_error("vector_create argument count is incorrect", true);

var vec;
vec[1] = argument[1];
vec[0] = argument[0];

return vec;