/// @description Update Physical Properties

// Inherit the parent event
event_inherited();


// HP --------------------------------------------------------------------------------------

	// Check HP for death
if( HP <= 0 )
{
	instance_destroy(id);
	exit;
}
	
	// HP regen
if( HP < stat[var_HP_max,0] )
	HP += stat[var_HP_max,0] * stat[var_regen,0] * global.DeltaTime;
	
	// Max HP changed
if( HP_max_old != stat[var_HP_max,0] )
{
	if( HP_max_old < stat[var_HP_max,0] )
		HP += stat[var_HP_max,0] - HP_max_old;
		
	HP_max_old = stat[var_HP_max,0];
}
	
	// HP greater than max HP
if( HP > stat[var_HP_max,0] ) 
	HP = stat[var_HP_max,0];

// -----------------------------------------------------------------------------------


// Update position
if( instance_exists( parent ) )
{	
	// rotate with parent
	
		// if the rotation of the component is locked, rotate with parent
	if(rotation_lock) 
		direction = self_direction + parent.direction;
		//note: non-rotation locked objects must provide their own rotation code 
	
	//move with parent	
	x = parent.x + lengthdir_x(off_l, parent.direction + off_d);
	y = parent.y + lengthdir_y(off_l, parent.direction + off_d);
}