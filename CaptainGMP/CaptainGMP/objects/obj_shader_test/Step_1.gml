/// @description Check Surface Existance

if( !surface_exists(screen) )
{
	screen = surface_create( room_width, room_height );	
}
