/// @description increase scale

if( debug_enabled )
	if( scale < 256)
		scale += max(0.25, scale*0.1);
