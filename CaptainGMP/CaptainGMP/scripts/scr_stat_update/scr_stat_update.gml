/// @description scr_stat_update( obj, index*, use_core_stat* )
/// @param obj
/// @param index*
/// @param use_core_stat*

// This script updates the (core) stat array
// if no argument for index or an negative value for index is passed, the entire array will be updated
// use_core_stat is by default set to false and can be optionally passed

var ind = -1;
if( argument_count > 1 )
	ind = argument[1];

var corestat = false;
if( argument_count > 2 )
	corestat = argument[2];

with( argument[0] )
{	
	var ar;
	if( corestat ) ar = core_stat;
	else ar = stat;
	
		// update everything?
	if( ind < 0 )
	{
		for( var i = array_height_2d( ar ) -1; i >= 0; i-- )
		{
			ar[@ i,0] = ar[i,1];
			for( var j = array_length_2d( ar, i ) -1; j>1; j-- )
			{
				ar[@ i,0] += ar[i,j];
			}
		}
	}
	else // update a specific index
	{
		if( ind < array_height_2d( ar ) ) // check if the index is valid
		{
			ar[@ ind,0] = ar[ind,1];
			for( var j = array_length_2d( ar, ind ) -1; j>1; j-- )
			{
				ar[@ ind,0] += ar[ind,j];
			}
		}
	}
}