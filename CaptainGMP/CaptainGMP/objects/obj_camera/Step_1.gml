/// @description move camera


if( instance_exists( focus ) )
{
	x = focus.x;
	y = focus.y
	rot = focus.direction - 90;
}


	//DEBUG
//rot += 1;
//scale_target = 2 + sin( get_timer() * 0.0000001 );

// adjust scale
if( scale != scale_target )
{
	var zoom = scale_target - scale;
	if( abs( zoom ) < 0.0025 )
		scale = scale_target;
	else
		scale += zoom * 0.25;
}

// calculate co-ordinates
x1 = x - vx * scale;
y1 = y - vy * scale;
x2 = x + vx * scale;
y2 = y + vy * scale;



	// update camera points
var len =  pyt( vx, vy ) * scale;
t[0] = point_direction(x,y,x1,y1);
t[1] = point_direction(x,y,x2,y1);
t[2] = point_direction(x,y,x1,y2);
t[3] = point_direction(x,y,x2,y2);

for( var i = 0; i < 4; i++ )
{
	p[i,0] = x + lengthdir_x( len, t[i] + rot );
	p[i,1] = y + lengthdir_y( len, t[i] + rot );
}

var c = 1;
