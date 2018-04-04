/// @description scr_draw_circulair_coloured_sprite( sprite, subimage, x, y, colour1, colour2, angle_start, percentage )
/// @param sprite
/// @param subimage
/// @param x
/// @param y
/// @param colour1
/// @param colour2
/// @param angle_start
/// @param percentage

// This script draws a colourised sprite in a circle

draw_primitive_begin_texture( pr_trianglelist, sprite_get_texture( argument0, argument1 ) );

var h_width, h_height, center_x, center_y, array;

h_width = sprite_get_width( argument0 ) * 0.5;
h_height = sprite_get_height( argument0 ) * 0.5;

center_x = h_width + argument2;
center_y = h_height + argument3;

array[0,0] = center_x + h_width;
array[0,1] = center_y + h_height;
array[0,2] = 45;

array[1,0] = center_x - h_width;
array[1,1] = center_y + h_height;
array[1,2] = 135;

array[2,0] = center_x - h_width;
array[2,1] = center_y - h_height;
array[2,2] = 225;

array[3,0] = center_x - h_width;
array[3,1] = center_y + h_height;
array[3,2] = 315;

//colour1

draw_vertex_texture_color( center_x, center_y, 0.5, 0.5, argument4, 1 ); // center with colour1






draw_primitive_end();