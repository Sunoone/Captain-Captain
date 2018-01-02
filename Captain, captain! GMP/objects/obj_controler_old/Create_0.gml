/// @description Ini
// You can write your code in this editor

scr_node_ini();

var hy = room_height * 0.5; // 
var hx = room_width * 0.5;  // 
var l_off = 96;

/*
for( var i = 0; i<4; i++ )
{
	for( var j = 0; j<360; j += 360 / ( 4 * power(2,i)) )
	{
		var hx_dir, hy_dir;
	
		hx_dir = hx + lengthdir_x(l_off + l_off * i, j);
		hy_dir = hy + lengthdir_y(l_off + l_off * i, j);
	
		instance_create_depth(hx_dir,hy_dir,0,obj_baseNode);
	}
}

instance_create_depth(hx,hy,0,obj_baseNode);
*/

selected = -5;
node_line = false;