/// @description update stats

// inherent the system objects end steps
event_inherited();

// Update all stats
if( update_variables )
{
	scr_stat_update( id );
	update_variables = false;
}