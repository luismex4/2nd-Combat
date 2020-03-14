/// @description Insert description here
// You can write your code in this editor

drop_shadows = surface_create(room_width, room_height);
surface_set_target(drop_shadows);
draw_clear_alpha(c_white, 0);


with obj_knight {
	draw_self();	
}

surface_reset_target();

draw_surface_ext(drop_shadows, 8, 8, 1, 1, 0, make_color_rgb(123, 0, 0), 0.5);

surface_free(drop_shadows);

drop_shadows = surface_create(room_width, room_height);
surface_set_target(drop_shadows);
draw_clear_alpha(c_white, 0);

with obj_player {
	draw_self();
}

surface_reset_target();

draw_surface_ext(drop_shadows, 8, 8, 1, 1, 0, c_blue, 0.5);

surface_free(drop_shadows);