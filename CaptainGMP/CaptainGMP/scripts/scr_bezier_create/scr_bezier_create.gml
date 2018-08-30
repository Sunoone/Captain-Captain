/// @description scr_bezier_create( V0, V1, V2, V3 )

/// @param V0
/// @param V1
/// @param V2
/// @param V3

// This script returns a cubic bezier curve, line goes through P0 and P3, guided by P1 and P2
// All input parameters are vectors

var B;

B[0] = argument0[0];
B[1] = argument0[1];

B[2] = argument1[0];
B[3] = argument1[1];

B[4] = argument2[0];
B[5] = argument2[1];

B[6] = argument3[0];
B[7] = argument3[1];

return B;
