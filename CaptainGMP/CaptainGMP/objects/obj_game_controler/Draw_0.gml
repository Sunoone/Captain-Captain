/// @description Debug Draw
// Draw fps

var col = c_green;
if( fps_real < 30 ) col = c_red;
else if( fps_real < 60 ) col = c_orange;

draw_text_color(10,10, string(fps_real), col, col, col, col, 1);

//scr_draw_sprite_loading( spr_ship_4, 0, 1200, 600, c_white, c_red, 45 );