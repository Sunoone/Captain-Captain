/// @description Init Ship

type = -1;
turning = 0;
var bShowGrid;
bShowGrid = true;

// ---------------------------------Temporary location ----------------------------------
// Uneven sizes are recommended when you want the core to be centered
globalvar xgridsize, ygridsize;
xgridsize = 7;
ygridsize = 7;
// ---------------------------------Temporary location ----------------------------------

coreX = floor((xgridsize - 1) / 2);
coreY = floor((ygridsize - 1) / 2);

hulls[xgridsize, ygridsize] = -1;
objects[xgridsize, ygridsize] = -1;

if (!bShowGrid)
	return;

var grid;
grid[xgridsize, ygridsize] = 0;
for (i = 0; i < xgridsize; i += 1)
	   for (e = 0; e < ygridsize; e += 1)	   
			//if (i == coreX && e == coreY) continue;	   
			grid[i, e] = scr_create_grid_object(obj_cell, 0, 0, i, e, 5, id, 0);