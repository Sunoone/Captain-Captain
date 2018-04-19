/// @description scr_random_offset( number, percentage )
/// @param number
/// @param percentage

// this script returns a value based on the given number with a random offset within the percentage of that number
// percentage is given as a fraction of 1 wherein 1 = 100%

var max_offset = argument0 * argument1;

return argument0 + random( max_offset * 2 ) - max_offset;

