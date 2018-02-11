/// @description Normalise Direction

direction += parent.direction - parent_direction;
parent_direction = parent.direction;

direction = direction mod 360;
while( direction < 0 ) direction += 360;

if( owner != original_owner )
{
	fire = false;
	reload = true;
}