/// @description draw background tiles

if( camera == -4 )
	exit;

scale = camera.scale;

var b_surface, b_width, b_height;
b_surface = scr_screen_surface_get_id( camera.screen_index );
b_width = surface_get_width(b_surface);
b_height = surface_get_height(b_surface);

var spr_width, spr_height, spr_count;

spr_width = sprite_get_width( background_sprite ) * scale;
spr_height = sprite_get_height( background_sprite ) * scale;
spr_count = sprite_get_number( background_sprite )-1;

surface_set_target( b_surface );

draw_clear( c_ltgray );

var seed;

for( var i = -1; i <= b_width + spr_width; i+= spr_width )
{
	for( var j = -1; j <= b_height + spr_height; j+= spr_height )
	{
		seed = i * (b_height + spr_height) + j;
		random_set_seed( seed );
		draw_sprite_ext( background_sprite, irandom( spr_count ), i,j, scale, scale, 90*irandom(3) /*+ camera.rot*/, c_white, 1 );
	}
}

surface_reset_target();

/*

// draw sprites according to camera angle

var x1,y1,x2,y2,dx0,dy0,dx90,dy90,len_spr,dxa,dya,vx,vy,x1g,y1g,x_max,x_min,y_max,y_min;

with( camera )
{
	x1 = p[0,0];
	y1 = p[0,1];
	x2 = p[3,0];
	y2 = p[3,1];

	x_max = max(p[0,0],p[1,0],p[2,0],p[3,0]);
	x_min = min(p[0,0],p[1,0],p[2,0],p[3,0]);
	y_max = max(p[0,1],p[1,1],p[2,1],p[3,1]);
	y_min = min(p[0,1],p[1,1],p[2,1],p[3,1]);
}

len_spr = pyt( spr_width, spr_height );

dx0 = lengthdir_x( len_spr, camera.rot );
dy0 = lengthdir_y( len_spr, camera.rot );
dx90 = lengthdir_x( len_spr, camera.rot + 90 );
dy90 = lengthdir_y( len_spr, camera.rot + 90 );

dxa = ceil( abs( (x1 - x2) / dx0 ) ) + 1;
dya = ceil( abs( (y1 - y2) / dy90 ) ) + 1;

x1g = round(x1/spr_width) * spr_width;
y1g = round(y1/spr_height) * spr_height;

var px,py;
for( var i = -1; i <= dxa; i++ )
{
	for( var j = -1; j <= dya; j++ )
	{
		px = x1g + i*dx0 + j*dx90;
		py = y1g + i*dy0 + j*dy90;
		
		seed = i * (b_height + spr_height) + j;
		random_set_seed( seed );
		draw_sprite_ext( background_sprite, irandom( spr_count ), i,j, scale, scale, 90*irandom(3) , c_white, 1 );
	}
}
