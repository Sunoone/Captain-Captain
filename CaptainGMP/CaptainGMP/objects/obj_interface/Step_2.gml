/// @description Insert description here
// You can write your code in this editor

// inherent the system objects end steps
event_inherited();

// Update interface
var global_player = global.player;

// interface visualization
if( scr_ability_check_running( id, global_player ) )
{
		// Find the position of the index number
	var c, p, t, m;
	c = ability_running[ global_player,0];
	p = ds_list_find_index( c.running_abilities_index, ability_running[global_player,1]  );
	t = c.running_abilities_time[|p];
	m = c.running_abilities_maxTime[|p];
	
	if( t > 0 )
	{
		ds_list_clear( interface_name_list );
		ds_list_clear( interface_number_list );
		
		interface_data = 1;
		
		ds_list_add( interface_name_list, m );
		ds_list_add( interface_number_list, t );
	}
}
else interface_data = 0;

// Remove destroyed children & update owned childern
var size;

size = ds_list_size(children);
ds_list_clear( owned_childern );

if( size>0 )
{
	for( var i = 0; i<size; i++ )
	{
		if( instance_exists( children[|i] ) == false )
		{
			ds_list_delete(children, i);
			i--;
			size--;
		}
	}
	
	if( size>0 )
	{
		ds_list_copy( owned_childern, children );
		
		for( var i = size - 1; i >= 0; i-- )
		{
			if( owned_childern[|i].owner != original_owner || owned_childern[|i].secret_owner != original_owner )
			{
				ds_list_delete( owned_childern, i );	
			}
		}
	}
}

// Update visual light_up -> legacy / interface to object data
if( light_up > 0 ) light_up -= global.DeltaTime;