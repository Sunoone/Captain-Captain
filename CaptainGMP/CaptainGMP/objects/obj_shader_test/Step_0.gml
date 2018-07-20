/// @description Draw Shader


surface_set_target( screen );

draw_clear_alpha(c_black,0);
shader_set( shader );

shader_set_uniform_f( testfloat, testfloat_value );

var r,h;
r = room_width;
h = room_height;

draw_primitive_begin(pr_trianglestrip);

draw_vertex( 0,0 );
draw_vertex( r,0 );
draw_vertex( 0,h );
draw_vertex( r,h );

/*
draw_primitive_begin_texture( pr_trianglestrip, sprite_get_texture(spr_ship_4, 0) );

draw_vertex_texture( 0,0,0,0 );
draw_vertex_texture( r,0,1,0 );
draw_vertex_texture( 0,h,0,1 );
draw_vertex_texture( r,h,1,1 );
*/

draw_primitive_end();

shader_reset();
surface_reset_target();