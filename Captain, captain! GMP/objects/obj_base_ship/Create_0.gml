/// @description Init Ship

// This builds in the core

// ---------------------------------Temporary location ----------------------------------
// The center of the grid that will be used to create the ship
// -> Currently using hardcoded position
globalvar xgridcenter;
globalvar ygridcenter;
xgridcenter = 400;
ygridcenter = 400;

// The size of a single gridspace

//cellsize = 63;

// Makes sure there is a cap to the grid
// Even gridsizes work, but will make you unable to place a single cell core in the exact center
// -> It will place it as close to the center as possible, but favors north-west.
globalvar xgridsize, ygridsize;
xgridsize = 11;
ygridsize = 11;

globalvar xgridmax, ygridmax, xgridmin, ygridmin;

var xboundaries = (xgridsize - 1) / 2;
xgridmax = ceil(xboundaries);
xgridmin = -floor(xboundaries);

var yboundaries = (ygridsize - 1) / 2;
ygridmax = ceil(yboundaries);
ygridmin = -floor(yboundaries);
// ---------------------------------Temporary location ----------------------------------


var core;
var coreX = 0;
var coreY = 0;


core = scr_create_ship_object(obj_core, 0, coreX, coreY, 0, id, 0);

var hulls;
var objects;

//hulls[0] = scr_create_ship_object(obj_core, 0, 1, 0, 1, id);



//var gridposition = ds_grid_create(xgridsize, ygridsize);
// 0 = ship_part
// 1 = controller
// 2 = component

var objects = ds_list_create();

// Player will always be the owner
//scr_create_ship_object(obj_core, 0, coreX, coreY, id);

scr_create_ship_object(obj_hull, 0, 1, 1, -1, id, 0);
scr_create_ship_object(obj_hull, 0, -1, 1, -1, id, 0);
