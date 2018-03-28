/// @description Update regulators
/*
// exit event in case of hacked or quarantined node
if( owner != original_owner || quarantine )
{
	exit;
}

	// Hacking
// add targets to childern
var size = ds_list_size( owned_childern );
var tar = ds_list_size( attack_id );

if( size > 0 )
{
	if( tar > 0 ) // attack hacked targets
	{		
		for( var i = 0; i < size; i++ )
		{
			ds_list_clear( owned_childern[|i].attack_id );
			
			var pos = i mod min(size, tar);
			ds_list_add( owned_childern[|i].attack_id, attack_id[| pos ] );
		}
	}
}


	// Defence
//Scan or Defend

// add targets to childern
size = ds_list_size( owned_childern );
if( size > 0 )
{
	if( ds_list_size( defend_id ) > 0 ) // attack hacked targets
	{
		scanning = false;
		
		for( var i = 0; i < size; i++ )
		{
			ds_list_clear( owned_childern[|i].defend_id );
			
			ds_list_add( owned_childern[|i].defend_id, defend_id[|0] );
		}
	}
	else	// resume scanning
	{
		scanning = true;
	}
}