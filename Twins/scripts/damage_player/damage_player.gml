with obj_player {
	dx = 0;
	status = "hit";
	current_animation = "hit";
	//dx += 1 * facing_direction;
	sleep_hack(50);
	screen_shake(1);
	var map = ds_map_create();
	skeleton_bone_state_get("head", map);
	var xx = ds_map_find_value(map, "worldX");
	var yy = ds_map_find_value(map, "worldY");
	spawn_blood( xx, yy, obj_player.facing_direction * -1, c_blue)
	play_rand_pitched_sound(snd_metal_hit2, .1);
}
