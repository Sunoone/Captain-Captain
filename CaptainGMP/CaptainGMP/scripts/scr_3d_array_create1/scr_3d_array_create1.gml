/// @desciption scr_3d_array_create( width, height, depth )
/// @param width
/// @param height
/// @param depth

// this script creates a new 3d array and returns the index

var data = global.data;
var c = data.count;

with( data )
{
	for( var i = 0; i < c; i++ )
	{
		if( occupied[i] == false )
		{
			c = i;
		
			for( var z = 0; z < argument2; z++ )
			{
				data_array[c,z] = ds_grid_create( argument0, argument1 );
			}
			break;
		}
	}

	if( c == count )
	{
		for( var z = 0; z < argument2; z++ )
		{
			data_array[c,z] = ds_grid_create( argument0, argument1 );
		}
		count++;
		break;
	}
	
	occupied[c] = true;
}

return c;