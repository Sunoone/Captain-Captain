/// @description scr_stat_get_array( obj, use_core_stat, percentage )
/// @param obj
/// @param use_core_stat
/// @param percentage

// this script fetches the right stat array

var ar;
with( argument0 )
{	
		// get the right stat array
	if( argument1 ) 
	{
		if( argument2 )
			ar = core_stat_p;
		else
			ar = core_stat;
	}
	else 
	{
		if( argument2 )
			ar = stat_p;
		else
			ar = stat;
	}
}
return ar;