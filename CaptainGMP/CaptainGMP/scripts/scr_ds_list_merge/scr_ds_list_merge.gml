/// @description scr_ds_list_merge( id, source )
/// @param id
/// @param source

// this script adds the source ds_list to the given ds_list

if( ds_exists( argument0, ds_type_list ) && ds_exists( argument1, ds_type_list ) )
{
	var size = ds_list_size( argument1 );
	
	for( var i = 0; i < size; i++ )
		ds_list_add( argument0, argument1[|i] )
}
