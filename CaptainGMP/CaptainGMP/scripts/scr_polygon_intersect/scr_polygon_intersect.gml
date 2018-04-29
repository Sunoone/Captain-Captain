/// @description scr_polygon_intersect( poly1, poly2 )
/// @param poly1
/// @param poly2

// this script returns true if the two polygons intersect
// the arguments are 2d array's containing all the points of the polygons, [p,0] = x, [p,1] = y

var x1, y1, x2, y2, x3, y3, x4, y4, intersect;

x2 = argument0[0,0];
y2 = argument0[0,1];

for( var i = array_height_2d( argument0 )-1; i >= 0; i-- )
{
	x1 = argument0[i,0];
	y1 = argument0[i,1];
	
	x4 = argument1[0,0];
	y4 = argument1[0,1];
	
	for( var j = array_height_2d( argument1 )-1; j >= 0; j-- )
	{
		x3 = argument1[j,0];
		y3 = argument1[j,1];
		
		intersect = scr_lines_intersect( x1, y1, x2, y2, x3, y3, x4, y4, true );
		if( 0 >= intersect && intersect <= 1 )
			return true;
		
		x4 = x3;
		y4 = y3;
	}
	
	x2 = x1;
	y2 = y1;
}

return false;