/// @description Debug Draw
// You can write your code in this editor

var col = c_green;
if( fps_real < 30 ) col = c_red;
else if( fps_real < 60 ) col = c_orange;

draw_text_color(10,10, string(fps_real), col, col, col, col, 1);