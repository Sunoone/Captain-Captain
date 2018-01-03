/// @description Init Ship

// This builds in the core

type = -1;

// ---------------------------------Temporary location ----------------------------------
// The center of the grid that will be used to create the ship
// -> Currently using hardcoded position
globalvar xgridlocation;
globalvar ygridlocation;
xgridlocation = 0;
ygridlocation = 0;

// Uneven sizes are recommended when you want the core to be centered
globalvar xgridsize, ygridsize;
xgridsize = 5;
ygridsize = 5;

// ---------------------------------Temporary location ----------------------------------

var core;
var coreX = floor((xgridsize - 1) / 2);
var coreY = floor((ygridsize - 1) / 2);

var hulls;
hulls[xgridsize, ygridsize] = 0;

var objects;
objects[xgridsize, ygridsize] = 0;


var bShowGrid;
bShowGrid = true;

if (!bShowGrid)
	return;

for (i = 0; i < xgridsize; i += 1)
	   for (e = 0; e < ygridsize; e += 1)	   
			//if (i == coreX && e == coreY) continue;	   
			hulls[i, e] = scr_create_grid_object(obj_cell, 0, 0, i, e, 5, id, 0);
