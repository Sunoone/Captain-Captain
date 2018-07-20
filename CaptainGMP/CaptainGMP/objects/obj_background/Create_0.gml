/// @description ini vars

shader = sha_desert;

scale = 1;
camera = -4;

// Shader Drawer
uv_rev_spr = spr_cloud;
uv_scale_uniform = shader_get_uniform( shader, "uv_scale" );
uv_scale = vector_create( (sprite_get_width(uv_rev_spr)/1024) , (sprite_get_height(uv_rev_spr)/1024) );

mode = 4;

screen_height = -4;
screen_normal = -4;
screen_colour = -4;
screen_final = -4;
screen_smooth = -4;

screen_pos[2] = 0;
mouse_old[1] = 0;


// heightmap shader -----------------------------------------------------------------
shader = sha_desert;


// height to normal shader ----------------------------------------------------------
uv_scale_i = shader_get_uniform( sha_height_to_normal, "uv_scale" );
uv_scale_v[1] = 0;

strength_i = shader_get_uniform( sha_height_to_normal, "strength" );
strength_v = 50.0;

uv_scale_i_2 = shader_get_uniform( sha_smooth, "uv_scale" );

// composite shader  ----------------------------------------------------------------
light_direction_i = shader_get_uniform( sha_composite, "light_direction" );
light_direction_v[2] = 0.3; 
light_direction_v[1] = 0.9; 
light_direction_v[0] = 0.6; 

light_colour_i = shader_get_uniform( sha_composite, "light_colour" );
light_colour_v[2] = 0.8; // B
light_colour_v[1] = 0.9; // G
light_colour_v[0] = 1.0; // R

normal_sampler = shader_get_sampler_index( sha_composite, "input_normal" );

