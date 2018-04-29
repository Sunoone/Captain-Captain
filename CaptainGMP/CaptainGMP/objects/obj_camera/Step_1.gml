/// @description move camera

x1 = x - vx * scale;
y1 = y - vy * scale;
x2 = x + vx * scale;
y2 = y + vy * scale;



	// update camera points
t[0,0] = pyt( x1, y1 );
t[0,1] = point_direction(x,y,x1,y1);

t[1,0] = pyt( x2, y1 );
t[1,1] = point_direction(x,y,x2,y1);

t[2,0] = pyt( x1, y2 );
t[2,1] = point_direction(x,y,x1,y2);

t[3,0] = pyt( x2, y2 );
t[3,1] = point_direction(x,y,x2,y2);

for( var i = 0; i < 4; i++ )
{
	p[i,0] = lengthdir_x( t[i,0], t[i,1] + rot );
	p[i,1] = lengthdir_y( t[i,0], t[i,1] + rot );
}

rot += 1;

scale = 2 + sin( get_timer() * 0.000001 );