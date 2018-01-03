/// @description scr_to_grid(object, owner, x, y, depth, hull, opt: parent)
/// @param int

var hulls = argument[5];

var xhullgrid = (floor(xgridmax / 2) - 1) + argument[4];
var yhullgrid = (floor(ygridmax / 2) - 1) + argument[3];

hulls[xhullgrid, yhullgrid] = scr_create_grid_object(argument[0], argument[1], argument[2], argument[3], argument[4], argument[6]);

return hulls;