/// @description scr_create_object(object, screen)
/// @param object
/// @param screen

// Returns true if you clicked on an object with x radius

if (argument_count != 2) show_error("scr_click_square argument count is incorrect", true)
if (!sprite_exists(argument0.sprite_index)) show_error("scr_click_square object argument has no sprite", true);

var xmousecorrect, ymousecorrect;
xmousecorrect = mouse_x - scr_screen_surface_get_x(argument1);
ymousecorrect = mouse_y - scr_screen_surface_get_y(argument1);

return (point_distance(xmousecorrect, ymousecorrect, x, y) <= sprite_get_width(argument0.sprite_index) / 2);
