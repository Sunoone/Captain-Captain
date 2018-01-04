/// @description Vector( vector1, vector2);
/// @param x
/// @param y

if( argument_count != 2) show_error("scr_create_array argument count is incorrect", true);

var a = (argument[0][0] - argument[1][0]) * (argument[0][0] - argument[1][0]);
var b = (argument[0][1] - argument[1][1]) * (argument[0][1] - argument[1][1]);

return a + b;