/// @description scr_calculate_drag( coefficient, density, velocity, area )

/// @param coefficient
/// @param density
/// @param velocity
/// @param area

// this script returns the drag based on the paramiters

// coefficient is the "smoothness" (skin friction and form drag) of the object
// density is the mass density in Kg/m3 of the fluid or gas that the object is traveling through
// velocity is the speed that the object is going
// area is the "size" of the object in m2

return argument0 * argument1 * power( argument2, 2 ) * 0.5 * argument3;