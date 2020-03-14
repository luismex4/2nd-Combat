if !object_exists(obj_knight)
	return;

draw_rectangle(obj_knight.wpn_min_x, obj_knight.wpn_min_y, 
			   obj_knight.wpn_max_x, obj_knight.wpn_max_y, 
			   true)

if stunned {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, image_alpha);
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, image_alpha);
}

