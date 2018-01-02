/// @description Draw nodeSurface
// You can write your code in this editor

globalvar nodeSurface, node_surface_x, node_surface_y;

if (!surface_exists(nodeSurface)) scr_node_surface();

draw_surface(nodeSurface,node_surface_x,node_surface_y);