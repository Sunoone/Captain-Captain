/// @description update vars



// Update CPU counter
cpu_available = cpu + cpu_bonus - cpu_budget;
if( owner == global.player )
{
	global.resource_display.CPU_max = cpu + cpu_bonus;
	global.resource_display.CPU_use = cpu_budget;
}
cpu_budget = 0;


// Negative CPU
if( cpu_available < 0 )
{
	// to do: something if the cpu_available is negative 
}

// update core abilities & feeder list
for( var i = ds_list_size( core_ability_id ) -1; i>= 0; i-- )
{
	if( instance_exists( core_ability_id[|i] ) == false )
		ds_list_delete( core_ability_id, i );
	else if( core_ability_id[|i].owner != owner && core_ability_id[|i].secret_owner != owner )
		ds_list_delete( core_ability_id, i );
}