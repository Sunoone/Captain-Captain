/// @description change owner

// Owner change
if( owner != delta_owner ) // owner has changed
{	
	// change core?
	if( owner >= 0 && owner < array_length_1d(global.owner_core) )
	{	
		if( instance_exists( global.owner_core[ owner ] ) )
		{
			core = global.owner_core[ owner ];
			//delta_owner = owner;
			register_abilities = true;
		}
	}
}

var secret_core = -4;
if( secret_owner >= 0 )
	secret_core = global.owner_core[ secret_owner ];

if( instance_exists( secret_core ) )
	apparent_owner[ secret_owner ] = secret_owner;

// inherent the system objects end steps
event_inherited();

delta_owner = owner;