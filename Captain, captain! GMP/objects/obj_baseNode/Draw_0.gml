/// @description Draw base node
// You can write your code in this editor

surface_set_target(nodeSurface);

if( node_active == false) draw_sprite(spr_baseNode,0,x,y);
else draw_sprite_ext( spr_baseNode,0,x,y, 1, 1, 0, c_yellow, 1 );

surface_reset_target();