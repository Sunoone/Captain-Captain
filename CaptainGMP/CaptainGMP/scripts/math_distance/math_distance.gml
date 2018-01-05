/// @description math_distance(vector1, vector2);
/// @param vector1
/// @param vector2

if( argument_count != 2) show_error("scr_create_array argument count is incorrect", true);

var vectora = argument[0];
var vectorb = argument[1];

var a = (vectora[0] - vectorb[0]) * (vectora[0] - vectorb[0]) ;
var b = (vectora[1] - vectorb[1]) * (vectora[1] - vectorb[1]) ;

return sqrt(a + b);