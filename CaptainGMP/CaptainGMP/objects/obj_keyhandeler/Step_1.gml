/// @description catch key input



	// Directional input
var directional_key_pressed = false;

for( var i = 0; i < 4; i++ )
{
	if( keyboard_check( directional_key[i] ) )
	{
		directional_translation[i,0] = lengthdir_x( 1, i * 90 );
		directional_translation[i,1] = lengthdir_y( 1, i * 90 );
		directional_key_pressed = true;
	}	
	else
	{
		directional_translation[i,0] = 0;
		directional_translation[i,1] = 0;
	}
}

if( directional_key_pressed )
{
	var input_x = 0;
	var input_y = 0;
	
	for( var i = 0; i < 4; i++ )
	{
		input_x += directional_translation[i,0];
		input_y += directional_translation[i,1]
	}
	
	global.input_direction[1] = point_direction( 0,0, input_x, input_y );
	directional_key_pressed = ( input_x != 0 || input_y != 0 );
}

global.input_direction[0] = directional_key_pressed;


