/// @description scr_create_array(*arg)
/// @param object
/// @param owner
/// @param x
/// @param y
/// @param depth
/// @param opt:parent
/// @param opt:direction

if( argument_count < 1) show_error("scr_create_array argument count is incorrect", true);

var arr;
for (var i=0;i<argument_count;i+=1)
{
    arr[i] = argument[i];
}
return arr;