/// @description Clear nodeSurface
// You can write your code in this editor

globalvar nodeSurface;

surface_set_target(nodeSurface);

draw_clear_alpha(c_black,0);

var s_width, s_height;
s_width = surface_get_width(nodeSurface);
s_height = surface_get_height(nodeSurface);

draw_rectangle_color(1,1,s_width -2, s_height -2, c_red,c_red,c_red,c_red,true );

surface_reset_target();