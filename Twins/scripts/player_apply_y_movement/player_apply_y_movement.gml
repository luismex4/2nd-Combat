with obj_player {
	//float at climax for a bit
	if v_speed == 0 && jump_climax_timer > 0
		jump_climax_timer -= 1;
	else {
		v_speed += grav;
		jump_climax_timer = jump_climax_duration
	}

	///collision
	// vertical collision
	var final_dy = v_speed + dy;
	y += final_dy;
	was_in_the_air = in_air;
	in_air = true;
	if (final_dy > 0) { //downwards
		var t1 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_bottom) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_bottom) & tile_index_mask;
		if (t1 != 0 || t2 != 0) {
			y -= final_dy;
			dy = 0;
			v_speed = grav;
			in_air = false;
		}
	} else { //upwards
		var t1 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_top) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_top) & tile_index_mask;
		
		if (t1 != 0 || t2 != 0) {
			y -= final_dy;
			v_speed = grav;
			dy = 0;
		} 	
	}
}