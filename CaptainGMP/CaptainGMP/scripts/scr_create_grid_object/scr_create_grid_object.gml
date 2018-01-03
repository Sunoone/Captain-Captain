/// @description scr_create_grid_object(object, grid, owner, x, y, depth, opt:parent, opt:direction)
/// @param object
/// @param grid
/// @param owner
/// @param x in gridspace
/// @param y in gridspace
/// @param depth
/// @param opt:parent
/// @param opt:direction


/* This script is simply used to create ship objects alligned with the grid. */
 

if( argument_count < 6 || argument_count > 8 ) show_error("scr_create_ship_object argument count is incorrect", true);

if (argument[3] > /*argument[1].*/xgridsize || argument[3] < 0 || argument[4] > /*argument[1].*/ygridsize || argument[4] < 0) show_error("placing object outside of gridspace", true);


//var xposition = xgridlocation -  + argument[2] * cellsize;
//var yposition = xgridlocation - (floor((ygridsize - 1) / 2) * cellsize) + argument[3] * cellsize;
var xdifference = floor((xgridsize - 1) / 2) * cellsize;
var ydifference = floor((ygridsize - 1) / 2) * cellsize
var xposition = 0 /*argument[6].x*/ - xdifference + argument[3] * cellsize;
var yposition = 0 /*argument[6].y*/ - ydifference + argument[4] * cellsize;

if(argument_count >= 7) 
{	
	return scr_create_object(argument[0], argument[1], xposition, yposition, argument[5],argument[6], argument[7]);
}

if(argument_count >= 6)
{
	return scr_create_object(argument[0], argument[1], xposition, yposition, argument[5],argument[6]);
}

return scr_create_object(argument[0], argument[1], xposition, yposition, argument[5]);

