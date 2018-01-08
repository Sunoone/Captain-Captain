/// @desciption scr_3d_array_exist( id )
/// @param id

// this script returns if the given 3d array exists

with( global.data )
{
	if( argument0 < 0 || argument0 >= array_length_1d(occupied) ) return false;
	return occupied[argument0];
}