/// @description scr_remove_projectile( pos )
/// @param pos

// This is a private script that removes a projectile from the lists nested inside the projectile array in the projectile manager
// DO NOT CALL THIS SCRIPT FROM OUTSIDE THE PROJECTILE MANAGER OBJECT!

var size = array_length_1d( projectile );

for( var p = 0; p < size; p++ )
{
	ds_list_delete( projectile[p], argument0 )	
}