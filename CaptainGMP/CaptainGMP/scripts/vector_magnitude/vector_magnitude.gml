/// @description vector_magnitude(vector)
/// @param vector

if( argument_count != 1) show_error("vector_magnitude argument count is incorrect", true);

var vector = argument[0];
return sqr(vector[0]) + sqr(vector[1]);
