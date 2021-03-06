/// @description scr_create_object(object, combatscreenindex)
/// @param object
/// @param combatscreenindex

// Returns true if you clicked on an object with x width and y height

if (argument_count != 2) show_error("scr_click_square argument count is incorrect", true)
if (!sprite_exists(argument[0].sprite_index)) show_error("scr_click_square object argument has no sprite", true);

var xmousecorrect, ymousecorrect;
xmousecorrect = mouse_x - scr_screen_surface_get_x(combat_screen_index);
ymousecorrect = mouse_y - scr_screen_surface_get_y(combat_screen_index);

var halfwidth, halfheight;
halfwidth = sprite_get_width(argument[0].sprite_index) / 2;
halfheight = sprite_get_height(argument[0].sprite_index) / 2;

return (xmousecorrect >= x - halfwidth && xmousecorrect <= x + halfwidth
	&& ymousecorrect >= y - halfheight && ymousecorrect <= y  + halfheight);