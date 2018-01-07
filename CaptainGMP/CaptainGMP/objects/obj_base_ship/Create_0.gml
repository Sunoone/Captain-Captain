/// @description Ini vars

// Inherit the parent event
event_inherited();

// Overwrite and add vars here
name = "Base Ship Object";
type = -1;

for( var i = 0; i < 4; i++ )
{
	ship_grid[i] = ds_grid_create(1,1);
}

armor = 0;	// ship armor value that protects components