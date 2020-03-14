current_health = 100;
status = "idle";
grav = 0.75;
v_speed = grav;
was_in_the_air = false;
in_air = false;
max_speed = 1;
move_speed = 4;
attacking = false;
attack_startup = false;
att_start_anim = "attack1_startup";
att_end_anim = "attack1_end";
hit = false;
attack_collison = false;
stunned = false;
blocking = false;
previous_animation = "";
facing_direction = -1;
old_animation = "idle";
current_animation = "idle";
distance_to_player = 0;
dy = 0;
dx = 0;

//hit spots
vulnerable_heights[0] = true;
vulnerable_heights[1] = false;
vulnerable_heights[2] = true;
hit_times = 0;
hit_attack_height = 0;

//tile map info
var l = layer_get_id("static_collision");
static_tilemap = layer_tilemap_get_id(l);


//idle
skeleton_animation_mix("idle","run", 0.1);
skeleton_animation_mix("idle","attack1_startup", 0.1);
skeleton_animation_mix("idle","attack1_miss", 0.1);

//run
skeleton_animation_mix("run","idle", 0.1);
skeleton_animation_mix("run","attack1_startup", 0.2);


//hit
skeleton_animation_mix("hit","idle", 0.1);
skeleton_animation_mix("hit","attack1_startup", 0.2);
skeleton_animation_mix("hit","run", 0.2);

//block
skeleton_animation_mix("block_high","run", 0.2);
skeleton_animation_mix("block_middle","run", 0.2);
skeleton_animation_mix("block_low","run", 0.2);

skeleton_animation_mix("block_high","idle", 0.2);
skeleton_animation_mix("block_middle","idle", 0.2);
skeleton_animation_mix("block_low","idle", 0.2);

skeleton_animation_mix("block_high","attack1_startup", 0.2);
skeleton_animation_mix("block_middle","attack1_startup", 0.2);
skeleton_animation_mix("block_low","attack1_startup", 0.2);

//attack 
skeleton_animation_mix("attack1_startup","idle", 0.03);
skeleton_animation_mix("attack1_startup","run", 0.03);

skeleton_animation_mix("attack1_end","run", 0.03);
skeleton_animation_mix("attack1_end","idle", 0.03);
//skeleton_animation_mix("attack1_end","attack1_miss", 0.2);

skeleton_animation_mix("attack1_miss","idle", 0.2);
//skeleton_animation_mix("attack1_startup","attack1_end", 0.1);
skeleton_animation_mix("attack1_end","attack1_startup", 0.02);

skeleton_animation_set("idle");

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