/// @description scr_draw_sprite_loading( sprite, subimage, x, y, colour1, colour2, percentage )
/// @param sprite
/// @param subimage
/// @param x
/// @param y
/// @param colour1
/// @param colour2
/// @param percentage

// This script draws a sprite in two parts colourised with colour 1 and 2
// percentage is a number between 0 and 100
// percentage is from bottom 0% to top 100%
// colour 1 is top, 2 is bottom

var height, width, p_height, p_tex, spr_y, spr_x;

width = sprite_get_width(argument0);
height = sprite_get_height(argument0);

spr_x = argument2 - sprite_get_xoffset(argument0);
spr_y = argument3 - sprite_get_yoffset(argument0);

p_height = height - height * (argument6 * 0.01 );
p_tex = (100 - argument6) * 0.01;

draw_primitive_begin_texture( pr_trianglelist, sprite_get_texture( argument0, argument1 ) );

	// Top
draw_vertex_texture_color( spr_x, spr_y,					0, 0,		argument4, 1 );
draw_vertex_texture_color( spr_x + width, spr_y,			1, 0,		argument4, 1 );
draw_vertex_texture_color( spr_x, spr_y + p_height,			0, p_tex,	argument4, 1 );

draw_vertex_texture_color( spr_x, spr_y + p_height,			0, p_tex,	argument4, 1 );
draw_vertex_texture_color( spr_x + width, spr_y,			1, 0,		argument4, 1 );
draw_vertex_texture_color( spr_x + width, spr_y + p_height, 1, p_tex,	argument4, 1 );

	// Bottom
draw_vertex_texture_color( spr_x, spr_y + p_height,			0, p_tex,	argument5, 1 );
draw_vertex_texture_color( spr_x + width, spr_y + p_height, 1, p_tex,	argument5, 1 );
draw_vertex_texture_color( spr_x, spr_y + height,			0, 1,		argument5, 1 );

draw_vertex_texture_color( spr_x + width, spr_y + p_height, 1, p_tex,	argument5, 1 );
draw_vertex_texture_color( spr_x, spr_y + height,			0, 1,		argument5, 1 );
draw_vertex_texture_color( spr_x + width, spr_y + height,	1, 1,		argument5, 1 );

draw_primitive_end();