x += dx;
//apply gravity/downward force always
dy += v_speed;
y += dy;
	
var t1 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_top) & tile_index_mask;
var t2 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_bottom) & tile_index_mask;
		
var t3 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_top) & tile_index_mask;
var t4 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_bottom) & tile_index_mask;
		
if (t1 != 0 || t2 != 0 || t3 != 0 || t4 != 0) {
	y += random_range(v_speed, 2);
	x += random_range(dx, 5);
	collision = true;
	//only deal with blood droping down on a flat surface for now
	cut_off_mask_y = ((bbox_top-13 & ~ 31) + 32) - sprite_bbox_bottom;
}

