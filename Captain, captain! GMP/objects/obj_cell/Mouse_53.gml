/// @description Debug - Spawn hull
// You can write your code in this editor

return;

if (scr_click_circle(id, global.combat_screen_index))
	scr_create_object(obj_hull, 0, 0, 0, -2, id, 0);
