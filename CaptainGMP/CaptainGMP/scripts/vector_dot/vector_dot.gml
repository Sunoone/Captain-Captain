/// @description vector_dot(vector1, vector2);
/// @param vector1
/// @param vector2


if( argument_count != 2) show_error("vector_dot argument count is incorrect", true);

var vector1 = argument[0];
var vector2 = argument[1];

var dot = vector1[0] * vector2[0] + vector1[1] * vector2[1];
//show_debug_message(dot);
var magnitudes;

var index = 1; magnitudes[index] = sqrt(sqr(vector1[index]) + sqr(vector2[index]));
	index = 0; magnitudes[index] = sqrt(sqr(vector1[index]) + sqr(vector2[index]));

var result = dot/(magnitudes[0] * magnitudes[1]);
//show_debug_message(result);
return result;