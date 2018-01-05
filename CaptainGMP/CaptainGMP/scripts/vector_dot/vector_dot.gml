/// @description vector_dot(vector1, vector2);
/// @param vector1
/// @param vector2


if( argument_count != 2) show_error("vector_dot argument count is incorrect", true);

//var vector1 = argument[0];
//var vector2 = argument[1];

var dot = argument0[0] * argument1[0] + argument0[1] * argument1[1];
//show_debug_message(dot);
var magnitudes;

var index = 1; magnitudes[index] = vector_magnitude(argument1);
	index = 0; magnitudes[index] = vector_magnitude(argument0);

var result = dot/(magnitudes[0] * magnitudes[1]);
//show_debug_message(result);
return result;