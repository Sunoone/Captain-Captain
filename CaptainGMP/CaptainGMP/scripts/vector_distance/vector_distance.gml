/// @description vector_distance.gml(vector1, vector2);
/// @param vector1
/// @param vector2

if( argument_count != 2) show_error("vector_distance.gml argument count is incorrect", true);

var vectora = argument[0];
var vectorb = argument[1];

var a = (vectora[0] - vectorb[0]) * (vectora[0] - vectorb[0]) ;
var b = (vectora[1] - vectorb[1]) * (vectora[1] - vectorb[1]) ;

return sqrt(a + b);