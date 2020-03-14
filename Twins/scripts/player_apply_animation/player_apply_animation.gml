with obj_player {
	//update current animation, if animation has changed
	if	( old_animation != current_animation && !attacking) {
		skeleton_animation_set(current_animation);
		var anim_debug = "Animation Switch to : " + current_animation;
		//show_debug_message(anim_debug);
		if current_animation == "run"
			image_speed = move_speed/3;
		else 
			image_speed = 1;
		old_animation = current_animation;
	}	
}