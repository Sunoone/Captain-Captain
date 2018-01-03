/// @description scr_create_ship_object(object, owner, x, y, depth, opt:parent, opt:direction)
/// @param object
/// @param owner
/// @param x in gridspace
/// @param y in gridspace
/// @param depth
/// @param opt:parent
/// @param opt:direction


/* This script is simply used to create ship objects alligned with the grid. */
 

if( argument_count < 5 || argument_count > 7 ) show_error("scr_create_ship_object argument count is incorrect", true);

if (argument[2] > xgridmax || argument[2] < xgridmin || argument[3] > ygridmax || argument[3] < ygridmin) show_error("placing object outside of gridspace", true);


var xposition = xgridcenter + argument[2] * cellsize;
var yposition = ygridcenter + argument[3] * cellsize;

if(argument_count >= 7) 
{	
	return scr_create_object(argument[0], argument[1], xposition, yposition, argument[4],argument[5], argument[6]);
}

if(argument_count >= 6)
{
	return scr_create_object(argument[0], argument[1], xposition, yposition, argument[4],argument[5]);
}

return scr_create_object(argument[0], argument[1], xposition, yposition, argument[4]);

