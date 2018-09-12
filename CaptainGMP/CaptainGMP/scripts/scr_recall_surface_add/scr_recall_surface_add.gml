/// @description scr_recall_surface_add( recall_id, x, y, rot, scale_x, scale_y, color, alpha, shader, prio, type, spr0, spr1*, spr2*, spr3* )

/// @param recall_id
/// @param x
/// @param y
/// @param rot
/// @param scale_x
/// @param scale_y
/// @param color
/// @param alpha
/// @param shader
/// @param prio
/// @param type
/// @param spr0
/// @param spr1*
/// @param spr2*
/// @param spr3*

// this script adds a draw element to a recall surface and returns the id for that element

// pass -4 though shader for no shader

var i = scr_ds_grid_find_value_width( global.recall_surface, argument[0], 0 );

if( i < 0 ) 
	return -4;

var rs, width, de_id;

rs = global.recall_surface[# i,2];
width = ds_grid_width( rs );

for( i = 1; i < width; i++ )
{
	if( rs[ i,8 ] > argument[9] )
		break;
}

scr_ds_grid_insert_column( rs, i, -4 );

de_id = get_timer();

rs[# i,0] = de_id;

for( var j = 1; j < argument_count; j++ )
	rs[# i,j] = argument[j];

// re-draw surface
scr_recal_surface_draw( argument[0] );

return de_id;