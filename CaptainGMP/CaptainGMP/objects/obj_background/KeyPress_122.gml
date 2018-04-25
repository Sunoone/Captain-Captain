/// @description random light direction

light_direction[0] = random(1.0);
light_direction[1] = random(1.0);
light_direction[2] = 1.0 - max( light_direction[0], light_direction[1] ) * 0.5;

//light_colour = scr_kelvin2rgb( irandom(6000) + 3000 );