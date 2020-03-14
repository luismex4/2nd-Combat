//draw_rectangle(wpn_min_x, wpn_min_y, 
//			   wpn_max_x, wpn_max_y, 
//			   true)

if status = "hit" {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_blue, image_alpha);
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, image_alpha);
}
