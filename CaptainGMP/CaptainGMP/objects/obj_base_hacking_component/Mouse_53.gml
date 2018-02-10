/// @description hack target

/*
if( global.player == owner )
{
	var int_a, length;

	int_a = global.interface_select_id;
	length = array_length_1d( int_a )

	for( var i = 0; i < length; i++ )
	{
		if( instance_exists( int_a[i] ) && int_a[i] != target_id && int_a[i] > 0 )
		{
			if( int_a[i].owner != owner )
			{
				target_id = int_a[i];
			
				break;
			}
		}
	}
}