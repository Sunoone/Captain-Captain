/// @description Ini vars

// this object displays player ship resources



	// CPU
CPU_max = 0;	// this is the maximum amount of CPU availiable
CPU_cost = 0;	// this variable lights up a part of the CPU bar to display cost
CPU_use = 0;	// this is the amount of CPU in use

CPU_surface_height = room_height;
CPU_surface_width = 20;

CPU_screen_index = scr_screen_surface_create( CPU_surface_width, CPU_surface_height, room_height * 0.5, 0, true );
CPU_surface = -4;

CPU_col = make_color_rgb( 46, 255, 40 );
CPU_col_cost = c_red;