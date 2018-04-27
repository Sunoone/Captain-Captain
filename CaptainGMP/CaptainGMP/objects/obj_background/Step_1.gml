/// @description draw background tiles

if( screen_index == -4 )
	exit;
	
var b_surface, b_width, b_height;
b_surface = scr_screen_surface_get_id( screen_index );
b_width = surface_get_width(b_surface);
b_height = surface_get_height(b_surface);

var spr_width, spr_height, spr_count;

spr_width = sprite_get_width( background_sprite ) * scale;
spr_height = sprite_get_height( background_sprite ) * scale;
spr_count = sprite_get_number( background_sprite )-1;

surface_set_target( b_surface );

draw_clear( c_ltgray );

var seed;

for( var i = -1; i <= b_width + spr_width; i+= spr_width )
{
	for( var j = -1; j <= b_height + spr_height; j+= spr_height )
	{
		seed = i * (b_height + spr_height) + j;
		random_set_seed( seed );
		draw_sprite_ext( background_sprite, irandom( spr_count ), i,j, scale, scale, 90*irandom(3), c_white, 1 );
	}
}

surface_reset_target();