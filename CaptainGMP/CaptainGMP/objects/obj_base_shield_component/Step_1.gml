/// @description Shield Regen & pass to ship

	// regen
if( active && /*!shield_on &&*/ shield_buffer < stat[var_shield_max,0] )
	shield_buffer += stat[var_shield_max,0] * stat[var_shield_regen,0] * global.DeltaTime; // regen in percentage per second
	
	// above max shield
if( shield_buffer > stat[var_shield_max,0] )
	shield_buffer = stat[var_shield_max,0]; // cap shield buffer to maximum buffersize
	
	// shield decay
if( !active && shield_buffer > 0 )
	shield_buffer -= stat[var_shield_max,0] * 0.25 * global.DeltaTime;	// shield buffer has a fixed 25% (per second) decay rate when the shield component is off
	
	// push shield buffer to parent ship
if( instance_exists( parent ) /*&& shield_on*/ && active )
{
	if( parent.owner == owner )
	{
		//parent.shield += shield_buffer;
		ds_list_add( parent.shield_list, id );
	}
}