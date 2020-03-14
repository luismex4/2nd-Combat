with obj_player {
	// horizontal collision
	horizontal_collision = false;
	x += dx;
		
	if (dx > 0) { //right
		var t1 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_top) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_bottom) & tile_index_mask;
		
		if (t1 != 0 || t2 != 0) {
			x -=  dx;
			horizontal_collision = true;
		}
	} else { //left
		var t1 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_top) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_bottom) & tile_index_mask;
		
		if (t1 != 0 || t2 != 0) {
			x -=  dx;
			horizontal_collision = true;
		}
	}
}