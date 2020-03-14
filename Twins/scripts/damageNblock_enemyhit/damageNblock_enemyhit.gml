var other_enemy = argument0;
var attack_height = argument1;

var joint_name = "none"
switch attack_height {
	case 0 :
		joint_name = "attackspot_high";
		break;
	case 1 :
		joint_name = "attackspot_middle";
		break;
	case 2 :
		joint_name = "attackspot_low";
		break;
	default:
		joint_name = "attackspot_middle";	
		break;
}

with other_enemy {
	if status == "attacking" 
		return;
	
	status = "hit";
	hit_attack_height = attack_height;
	x += 1 * obj_player.facing_direction;
	sleep_hack(1);
	screen_hit();
	var map = ds_map_create();
	skeleton_bone_state_get(joint_name, map);
	var xx = ds_map_find_value(map, "worldX");
	var yy = ds_map_find_value(map, "worldY");
	spawn_blood( xx, yy, obj_player.facing_direction*2, c_red)
	play_rand_pitched_sound(snd_metal_hit, .1);
	hit_times += 1;
	alarm[5] = 50;
	other_enemy.current_health -= 50;
}