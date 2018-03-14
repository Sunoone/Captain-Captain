/// @description Disable object

if( instance_exists( target ) )
{
	target.owner = -1 * get_timer();	// scramble ownership
	
	target = -4;
}
