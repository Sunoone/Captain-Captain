/// @description scr_stat_update( obj, index*, use_core_stat* )
/// @param obj
/// @param index*
/// @param use_core_stat*

// This script updates the (core) stat array
// if no argument for index or an negative value for index is passed, the entire array will be updated
// use_core_stat* is by default set to false and can be optionally passed
// percentage* is by default set to false and is used to set percentage change over stat, 1.0 = 100%

var ind = -1;
if( argument_count > 1 )
	ind = argument[1];

var corestat = false;
if( argument_count > 2 )
	corestat = argument[2];

with( argument[0] )
{	
		// get the right stat array
	var ar = scr_stat_get_array( argument[0], corestat, false );
	var ar_p = scr_stat_get_array( argument[0], corestat, true );
	
		// update everything?
	if( ind < 0 )
	{
		for( var i = array_height_2d( ar ) -1; i >= 0; i-- )
		{
			ar[@ i,0] = ar[i,1];
			ar_p[@ i,0] = ar_p[@ i,1];
			
			for( var j = array_length_2d( ar, i ) -1; j>1; j-- )
				ar[@ i,0] += ar[i,j];
				
			for( var j = array_length_2d( ar_p, i ) -1; j>1; j-- )
				ar_p[@ i,0] += ar_p[@ i,j];
				
			ar[@ i,0] *= ar_p[@ i,0];
		}
	}
	else // update a specific index
	{
		if( ind < array_height_2d( ar ) ) // check if the index is valid
		{
			ar[@ ind,0] = ar[ind,1];
			ar_p[@ ind,0] = ar_p[@ ind,1];
			
			for( var j = array_length_2d( ar, ind ) -1; j>1; j-- )
				ar[@ ind,0] += ar[ind,j];
				
			for( var j = array_length_2d( ar_p, ind ) -1; j>1; j-- )
				ar_p[@ ind,0] += ar_p[@ ind,j];
				
			ar[@ ind,0] *= ar_p[@ ind,0];
		}
	}
}