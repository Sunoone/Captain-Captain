/// @description vector_subtract(vector1, float);
/// @param vector1
/// @param vector2


if( argument_count != 2) show_error("vector_subtract argument count is incorrect", true);

var vector1 = argument[0];
var float = argument[1];

vector1[1] /= float;
vector1[0] /= float;

return vector1;