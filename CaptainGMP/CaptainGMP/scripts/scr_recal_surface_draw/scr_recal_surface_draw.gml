/// @description scr_recal_surface_draw( recall_id )

/// @param recall_id

// this script draws the given recall surface


var i = scr_ds_grid_find_value_width( global.recall_surface, argument[0], 0 );

	// cannot find the given id
if( i < 0 ) 
	exit;

	// does the surface still exists?
if( !surface_exists( global.recall_surface[# i,1] ) )
	global.recall_surface[# i,1] = surface_create( global.recall_surface[# i,3], global.recall_surface[# i,4] );
	
surface_set_target( global.recall_surface[# i,1] );

var rs,width,ch1,ch2,ch3,shader;

rs = global.recall_surface[# i,2];
width = ds_grid_width( rs );
shader = -4;

for( i = 1; i < width; i++ )
{
		// set shader
	if( shader != rs[# i,8] )
	{
		shader = rs[# i,8];
		
		if( shader >= 0 )
		{
			shader_set(shader);
		
			ch1 = shader_get_sampler_index( shader, "ch1" );
			ch2 = shader_get_sampler_index( shader, "ch2" );
			ch3 = shader_get_sampler_index( shader, "ch3" );		
		}
		else 
			shader_reset();
	}
	
		// set sprite channels
	if( shader >= 0  )
		for( var t = 0; t < 3; t++ )
			if( sprite_exists( rs[# i,13 + t] ) )
				texture_set_stage( ch1, sprite_get_texture( rs[# i,13+t], 0 ) );
	
		// draw sprite
	draw_sprite_ext( rs[# i,12],0,rs[# i,1],rs[# i,2],rs[# i,4],rs[# i,5],rs[# i,3],rs[# i,6],rs[# i,7] );
}

shader_reset();
surface_reset_target();