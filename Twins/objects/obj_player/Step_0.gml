
switch status {
	case "idle":
		break;
	case "deflect":
		player_apply_x_movement();
		player_apply_y_movement();
		return;
	case "parry_end":
		current_animation = "parry_end";
		player_apply_animation();
		player_apply_x_movement();
		player_apply_y_movement();
		return;
	case "parry":
		dx = 0;
		current_animation = "parry_start";
		player_apply_animation();
		image_speed = 1.2;
		player_apply_x_movement();
		player_apply_y_movement();
		var frame_i = floor(skeleton_animation_get_frame(0));
		var end_frame_i = skeleton_animation_get_frames(current_animation);
		if frame_i == end_frame_i-3 {	
			skeleton_animation_set_frame(0, 7);
			image_speed = 0;
			alarm[0] = parry_time;
			status = "deflect";
		}
		return;
	case "dodging":
			// horizontal collision
		dx = 4 * facing_direction;
		player_apply_x_movement();
		player_apply_y_movement();
		return;
	case "blocked":
		dx = 0;
		player_apply_x_movement();
		player_apply_y_movement();
		return;
	case "hit":
		player_hit();
		dx = 0;
		player_apply_x_movement();
		player_apply_y_movement();
		return;
}
	
if !attacking && !in_air && !just_landed
    current_animation = "idle";

//should you jump?
//var t1 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_bottom + 1) &	tile_index_mask;
//var t2 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_bottom - 1) & tile_index_mask; (t1 != 0 || t2 != 0)
if (keyboard_check(vk_space) && !in_air && !(just_landed && attacking)) {
	v_speed = -jump_impulse;
	current_animation = "Jump-rise";
}

if(keyboard_check(ord("Q"))){
	status = "parry"
	current_animation = "parry_start";
}

if keyboard_check(ord("H")) {
	current_animation = "dodge";
	status = "dodging";
	player_apply_animation();
	image_speed = 1.5;
	return;
}

//start up friction
var st_friction_delta = .05;
if (keyboard_check(ord("D")) || keyboard_check(ord("A")))
	startup_ratio = min(startup_ratio + st_friction_delta, 1);
else
	startup_ratio = max(startup_ratio - st_friction_delta, 1);;
	
//adjust air movement
var current_move_speed = move_speed * !((just_landed && attacking) || attacking);
if in_air
	current_move_speed = 1;

//initialize the deltas
dx += ((current_move_speed * startup_ratio) * (keyboard_check(ord("D")) - keyboard_check(ord("A"))));
// dy is taken into account in player tile vertical collison check seprate script

///collision
// vertical collision
player_apply_y_movement();

//friction
var endrun_friction = .5;
if (in_air)
	endrun_friction = .8;

if( dx > 0 ) {
	dx = max(0, dx - endrun_friction);
	dx = min(dx, max_speed);
}
else if (dx < 0) {
	dx = min(dx + endrun_friction, 0);
	dx = max(dx, -max_speed);
}
	
// horizontal collision
player_apply_x_movement();

if (was_in_the_air && was_in_the_air != in_air) {
	if attacking {
		if (keyboard_check(ord("D")) || keyboard_check(ord("A")))
			current_animation = "Jump-landRun";
		else
			current_animation = "Jump-landStand";
		
		spawn_effect(x + (facing_direction * 100), y, facing_direction, obj_air_effect2);
	}
	else
		current_animation = "Jump-fall";
	instance_create_layer(x, y, "background_effects", obj_air_effect1);
	just_landed = true;
	if(old_animation != current_animation) {
		skeleton_animation_set(current_animation);
		old_animation = current_animation;
	}
}

if keyboard_check_pressed(ord("J")) && !attacking && !(just_landed && !in_air) {
	current_animation = "attack-high";
	attack_height = 0;
	play_rand_pitched_sound(snd_sword_swosh1, .5);
	attacking = true;
	old_animation = current_animation;
	skeleton_animation_set(current_animation);
	image_speed = 2;
} else if keyboard_check_pressed(ord("K")) && !attacking && !(just_landed && !in_air) {
	current_animation = "attack-middle";
	attack_height = 1;
	play_rand_pitched_sound(snd_sword_swosh1, .5);
	attacking = true;
	old_animation = current_animation;
	skeleton_animation_set(current_animation);
	image_speed = 2;
	
} else if keyboard_check_pressed(ord("L")) && !attacking && !(just_landed && !in_air) {
	current_animation = "attack-low";
	attack_height = 2;
	play_rand_pitched_sound(snd_sword_swosh1, .5);
	attacking = true;
	old_animation = current_animation;
	skeleton_animation_set(current_animation);
	image_speed = 2;
}

//Start of attack
if keyboard_check_pressed(ord("E")) && !attacking && !(just_landed && !in_air) {	
	// cancel all other attacks if your in the air
	if(in_air) {
		current_animation = "Jump-attackAir";
		attack_time = 9999999999999999999;
	} else {
		play_rand_pitched_sound(snd_sword_swosh1, .5);
	}
	attacking = true;
	old_animation = current_animation;
	skeleton_animation_set(current_animation);
}

//Animation
var old_facing_direction = facing_direction;
if (dx != 0 && horizontal_collision = false && !in_air && !(just_landed && attacking)){
	current_animation = "run";
	just_landed = false;
	if(keyboard_check(ord("D")))
		facing_direction = 1;
	else if (keyboard_check(ord("A")))
		facing_direction = -1;
}

if (old_facing_direction != facing_direction)
	image_xscale *= -1;

//update current animation, if animation has changed
player_apply_animation();

//find weapon bounding box(min max values)
wpn_min_x = 99999999;
wpn_min_y = 99999999;
wpn_max_x = -9999999;
wpn_max_y = -9999999;
var num = skeleton_get_num_bounds();
for(var i = 0; i < num; i++;) {
    var b_info = skeleton_get_bounds(i);
	
    if (b_info[0] > 0 && b_info[1] == "cb_weapon") {
        for(var j = 0; j < b_info[0]; j++;) {
			var current_x = b_info[(j * 2) + 2];
			var current_y = b_info[(j * 2) + 2 + 1];
            
			wpn_max_x = (current_x > wpn_max_x ? current_x : wpn_max_x);
			wpn_max_y = (current_y > wpn_max_y ? current_y : wpn_max_y);
			wpn_min_x = (current_x < wpn_min_x ? current_x : wpn_min_x);
			wpn_min_y = (current_y < wpn_min_y ? current_y : wpn_min_y);
        }
    }
}

if attacking {
	var inst = collision_rectangle(wpn_min_x, wpn_min_y, 
								   wpn_max_x, wpn_max_y, 
							       obj_knight, true, true);
	var attack_blocked = false;
	if inst != noone && !ds_map_exists(hit_enemies, inst) {
		// -- attack was suscceful
		if obj_knight.vulnerable_heights[attack_height] {
			damageNblock_enemyhit(inst, attack_height);
			ds_map_add(hit_enemies, inst, true);		
		// -- attack was blocked
		} else if (obj_knight.facing_direction != facing_direction) {
			current_animation = "attack-blocked";
			attacking = false;
			status = "blocked"
			player_apply_animation();
			spawn_effect_at_attackspot(obj_knight, obj_explosion_small, attack_height);
		}
	}
	// -- attack not blocked do impulse
	if !attack_blocked {
		// -- spawn impulse
		var map = ds_map_create();
		skeleton_bone_state_get("blade", map);
		var xx = ds_map_find_value(map, "worldX");
		var yy = ds_map_find_value(map, "worldY");
		SR_apply_impulse_ragdoll(xx, yy);
	}
}

//for debug
//skeleton_collision_draw_set(true);