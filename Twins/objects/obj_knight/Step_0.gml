switch status {
	case "hit":
		if current_health <= 0{
			var map = ds_map_create();
			skeleton_bone_state_get("Head", map);
			var xx = ds_map_find_value(map, "worldX");
			var yy = ds_map_find_value(map, "worldY");
			inst = instance_create_depth(xx, yy, 0, obj_knight_ragdoll);
			instance_destroy();
			return;
		}
			
		if hit_times > 1 {
			//var rand_block = irandom_range(0, 4);
			switch hit_attack_height {
				case 0 :
					current_animation = "block_high";
					vulnerable_heights[0] = false;
					vulnerable_heights[1] = true;
					vulnerable_heights[2] = true;
					break;
				case 1 :
					current_animation = "block_middle";
					vulnerable_heights[0] = true;
					vulnerable_heights[1] = false;
					vulnerable_heights[2] = true;
					break;
				case 2 :
					current_animation = "block_low";
					vulnerable_heights[0] = true;
					vulnerable_heights[1] = true;
					vulnerable_heights[2] = false;
					break;
				default:
					current_animation = "hit";	
					vulnerable_heights[0] = true;
					vulnerable_heights[1] = true;
					vulnerable_heights[2] = true;
					break;
			}
		} else {
			// -- first hit is always a "stun"
			current_animation = "hit";
			vulnerable_heights[0] = true;
			vulnerable_heights[1] = true;
			vulnerable_heights[2] = true;
		}
		
		//update current animation, if animation has changed
		if	( old_animation != current_animation) {
			skeleton_animation_set(current_animation);
			previous_animation = old_animation;
			old_animation = current_animation;
		}
		skeleton_animation_set_frame(0, 4);
		image_speed = 0;
		stunned = true;
		attack_startup = false;
		return;
	case "attack_startup":
		break;
	case "attack_miss":
		break;
	case "idle":
		current_animation = "idle";
		break;
	case "attacking":
		var inst = collision_rectangle(wpn_min_x, wpn_min_y, 
								   wpn_max_x, wpn_max_y, 
							       obj_player, true, true);
		if inst != noone && obj_player.status != "hit" && obj_player.status != "dodging" {
			
			if obj_player.status == "deflect" {
				x += 20 * obj_player.facing_direction;
				attacking = false;
				obj_player.parry_failed = false;
				damageNblock_enemyhit(obj_knight, 4);
				spawn_effect_at_sword(obj_explosion_small);
				play_rand_pitched_sound(snd_deflect, .5);
			} else {
				damage_player();
				attack_collison = true;
			}		
		}
		break;
}

if stunned 
	return;

//apply gravity/downward force always
dy = v_speed;

var directionX = obj_player.x - x;
var old_facing_direction = facing_direction;
if status != "attacking" || status != "attack_startup" { 
	facing_direction = directionX/abs(directionX);
}

if instance_exists(obj_player)
{
	distance_to_player = distance_to_object(obj_player);
	if distance_to_player > 5 {		
		dx += move_speed * facing_direction;
	} 
	else if status == "idle" {
		current_animation = "attack1_startup";
		status = "attack_startup";
		att_start_anim = "attack1_startup";
		att_end_anim = "attack1_end";
	}
}

///collision
// vertical collision
y += dy;
was_in_the_air = in_air;
in_air = true;
if (dy > 0) { //downwards
	var t1 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_bottom) &	tile_index_mask;
	var t2 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	if (t1 != 0 || t2 != 0) {
		y -= dy;
		v_speed = grav;
		in_air = false;
	}
} else { //upwards
	var t1 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_top) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		y -= dy;
		v_speed = grav;
	} 	
}

if (v_speed > 0 && in_air) {
	current_animation = "Jump-InAir";
}

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
var horizontal_collision = false;
if status == "idle"
	x += dx;
	
if (dx > 0) { //right
	var t1 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(static_tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		x -=  dx;
		horizontal_collision = true;
	}
} else { //left
	var t1 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_top) &	tile_index_mask;
	var t2 = tilemap_get_at_pixel(static_tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		x -=  dx;
		horizontal_collision = true;
	}
}

//Animation
if (dx != 0 && !horizontal_collision && status == "idle") {
	current_animation = "run";
	just_landed = false;
}

// -- turn the image
if (old_facing_direction != facing_direction && !(status == "attacking" ||  status == "attack_startup" || status == "attack_miss"))
	image_xscale *= -1;
else 
	facing_direction = old_facing_direction;

//update current animation, if animation has changed
if	( old_animation != current_animation) {
	show_debug_message(current_animation);
	skeleton_animation_set(current_animation);
	if current_animation == "run"
		image_speed = move_speed/3;
	else 
		image_speed = 1;
	previous_animation = old_animation;
	old_animation = current_animation;
}

//find weapon bounding box(min max values)
wpn_min_x = 99999999;
wpn_min_y = 99999999;
wpn_max_x = -9999999;
wpn_max_y = -9999999;
var num = skeleton_get_num_bounds();
for(var i = 0; i < num; i++;) {
    var b_info = skeleton_get_bounds(i);
	
    if (b_info[0] > 0 && b_info[1] == "kn_sword_cb") {
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

//for debug
//skeleton_collision_draw_set(true);