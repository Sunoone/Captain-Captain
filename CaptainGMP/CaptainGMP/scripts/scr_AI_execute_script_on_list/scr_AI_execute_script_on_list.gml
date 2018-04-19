/// @description scr_AI_execute_script_on_list( ds_list, index, script, core, icon, limit, sound )
/// @param ds_list
/// @param index
/// @param script
/// @param core
/// @param icon
/// @param limit
/// @param sound

// this script finds a suitable target for the given script and executes it
// this script repeats up to the limit or the list runs out

var node, core, owner, limit, index;

core = argument3;
owner = core.owner;
limit = argument5;
index = argument1;

for( var i = ds_list_size( argument0 )-1; i >= 0; i-- )
{
	node = argument0[|i];
	ds_list_delete( argument0, i );
		
	if( instance_exists( node ) )
	{
		if( scr_ability_excecute_script( 0, argument2, node, core ) )
		{
			var cost = scr_ability_excecute_script( 1, argument2, node, core );
					
			if( cost < core.cpu_available )
			{				
				action_current[@ index,0] = true;		// scan active
				action_current[@ index,1] = node;		// scan target
				action_current[@ index,2] = scr_ability_initiate( 
					core, 
					node, 
					argument2,
					scr_ability_excecute_script( 2, argument2, node, core ),
					cost,
					argument4,
					argument6
				);
				
				limit -= 1;
				if( limit <= 0 )
					exit;
			}
		}
	}
}