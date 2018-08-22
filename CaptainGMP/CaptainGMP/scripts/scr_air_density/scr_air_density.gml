/// @description scr_air_density( altitude, temp )
/// @param altitude
/// @param temp

// this script returns the air density based off the altitude and temperature at sea level

// altitude in meters
// temp in degrees Celcius


if( argument0 > 80000 ) return 0; // formula breaks down above this altitude
if( argument0 < 0 ) return 10250; // density of surface level ocean

var altitude, temp_base, g, temp_abs, Pa, density, lapse;

altitude = argument0;
temp_base = argument1 + 273.15;

// Temperature Lapse Rate, K/m
lapse = 0.0065 / (1 + altitude / 16745 );

temp_abs = temp_base - altitude * lapse;


// gravity
g = 9.80665 * power( 6371000 / (6371000 + altitude), 2 );

// Pascals of air preasure at given height
//Pa = 101325 * power( 1 - (0.0065 * altitude) / base_temp, 5.25578129287 );

Pa = 101325 * power( temp_base / ( temp_base + altitude * lapse ), ( g * 0.0289644 ) / ( 8.3144598 * lapse ) );

// Air density in kg/m3
density = Pa / ( 287.058 * temp_abs );

return 10 * density;