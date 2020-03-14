switch status {
	case "hit":
		status = "idle";
		hit_times = 0;
		break;
	case "attacking":
		if attack_collison
			status = "idle";
		else {
			status = "attack_miss";
			current_animation = "attack1_miss";
		}
		// -- make sure attack_collision is false at the end
		attack_collison = false;
		break;
	case "attack_startup":
		if current_animation == att_start_anim {
			status = "attacking";
			current_animation = "attack1_end";
			play_rand_pitched_sound(snd_sword_swosh3, .5);
		}
		break;
	case "idle":
		break;
	case "attack_miss":
		status = "idle";
		break;
}