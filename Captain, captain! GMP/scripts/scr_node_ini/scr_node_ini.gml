///scr_node_ini()

// This script creates a global array to save nodes in.

globalvar node, node_surface_x, node_surface_y, node_connections;

node_surface_x = 0;
node_surface_y = 0;
node[0,0] = -5;
node_connections = ds_list_create();

scr_node_surface();