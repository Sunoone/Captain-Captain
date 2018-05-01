/// @description Ini vars

x1 = 0;
y1 = 0;
x2 = room_width - 20 - room_height * 0.5;
y2 = room_height;

x = (x1 + x2) * 0.5;
y = (y1 + y2) * 0.5;

vx = x - (x2*0.5);
vy = y - (y2*0.5);

scale = 1;
scale_target = 2.5;

rot = 0;

p[3,1] = 0;
t = 0;

screen_index = -4;

focus = -4;