if collision && surface_exists(obj_blood_surface.blood_surface) {
	surface_set_target(obj_blood_surface.blood_surface);
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, 
					blood_color, random_range(.3, .8));
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite(spr_cut_off,-1, x, cut_off_mask_y);
	
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	instance_destroy();
	return;
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, 
				blood_color, random_range(.5, .9));