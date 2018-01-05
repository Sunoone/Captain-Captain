/// @description math_add_vectors(vector1, vector2);
/// @param vector1
/// @param vector2


if( argument_count != 2) show_error("math_add_vectors argument count is incorrect", true);

var vector1 = argument[0];
var vector2 = argument[1];

var vector3;
vector3[1] = vector1[1] + vector2[1];
vector3[0] = vector1[0] + vector2[0];

return vector3;