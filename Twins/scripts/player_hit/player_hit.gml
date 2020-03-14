with obj_player {
	//update current animation, if animation has changed
	if	( old_animation != current_animation) {
		skeleton_animation_set(current_animation);
		var anim_debug = "Animation Switch to : " + current_animation;
		show_debug_message(anim_debug);
		old_animation = current_animation;
	}
	///collision
    player_apply_y_movement();
	player_apply_x_movement();
}