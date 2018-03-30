/// @description Update



// Update CPU counter

	// calculate running ability cost
var ability_cost = 0;

for( var i = ds_list_size( running_abilities_cost ) -1; i >=0; i-- )
{
	ability_cost += running_abilities_cost[|i];
}


cpu_available = cpu + cpu_bonus - cpu_budget - ability_cost;

if( owner == global.player )
{
	global.resource_display.CPU_max = cpu + cpu_bonus;
	global.resource_display.CPU_use = cpu_budget + ability_cost;
}
cpu_budget = 0;


// Negative CPU
if( cpu_available < 0 )
{
	// to do: something if the cpu_available is negative 
		// >1 time dilation?
}


// Update core abilities & feeder list
for( var i = ds_list_size( core_ability_id ) -1; i>= 0; i-- )
{
	if( instance_exists( core_ability_id[|i] ) == false )
		ds_list_delete( core_ability_id, i );
	else if( core_ability_id[|i].owner != owner && core_ability_id[|i].secret_owner != owner )
		ds_list_delete( core_ability_id, i );
}


// Update running abilities
var exist, DeltaTime;
DeltaTime = global.DeltaTime;

for( var i = ds_list_size( running_abilities_time ) -1; i >=0; i-- )
{
	running_abilities_time[|i] -= DeltaTime;
	exist = instance_exists( running_abilities_target[|i] );

	if( running_abilities_time[|i] <= 0 || !exist )
	{
		if( exist )
		{
			scr_ability_deregister_node( running_abilities_target[|i], id );
			scr_ability_excecute_script( 3, running_abilities_script[|i], running_abilities_target[|i], id );
		}
		
		ds_list_delete( running_abilities_target, i );
		ds_list_delete( running_abilities_script, i );
		ds_list_delete( running_abilities_index, i );
		ds_list_delete( running_abilities_time, i );
		ds_list_delete( running_abilities_cost, i );
		ds_list_delete( running_abilities_icon, i );
	}
}