/// @description vector_sqrmagnitude(vector)
/// @param vector

if( argument_count != 1) show_error("vector_sqrmagnitude argument count is incorrect", true);

var vector = argument[0];
return sqr(vector[0]) + sqr(vector[1]);
