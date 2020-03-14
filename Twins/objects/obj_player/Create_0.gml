status = "idle"
attacking = false;
just_landed = false;
move_speed = 2;
max_speed = 5;
jump_impulse = 12;
grav = 0.75;
v_speed = grav;
old_animation = "idle";
facing_direction = 1;
in_air = false;
//parry action
parry_failed = false;
parry_time = 50;
//
was_in_the_air = false;
dx = 0;
dy = 0;
jump_climax_duration = 3;
jump_climax_timer = 0;
startup_ratio = 0;
// attack type
// 0 is high attack
// 1 is middle attacks
// 2 is low attack
attack_height = 1;
//collision
horizontal_collision = false;
//track enemies that have been hit on this attempt
hit_enemies = ds_map_create();

//weapon collision box info
wpn_min_x = 99999999;
wpn_min_y = 99999999;
wpn_max_x = -9999999;
wpn_max_y = -9999999;

//tile map info
var l = layer_get_id("static_collision");
static_tilemap = layer_tilemap_get_id(l);


// -- animation mix's
//idle
skeleton_animation_mix("idle","run", 0.1);
skeleton_animation_mix("idle", "attack1", 0.2);
skeleton_animation_mix("idle", "Jump-rise", 0.2);
skeleton_animation_mix("idle", "Jump-InAir", 0.2);
skeleton_animation_mix("idle", "Jump-fall", 0.2);
////run
skeleton_animation_mix("run", "idle", 0.1);
skeleton_animation_mix("run", "attack1", 0.2);
skeleton_animation_mix("run", "Jump-rise", 0.2);
skeleton_animation_mix("run", "Jump-InAir", 0.2);
skeleton_animation_mix("run", "Jump-fall", 0.2);
////attack
skeleton_animation_mix("attack1", "run", 0.2);
skeleton_animation_mix("attack1", "idle", 0.2);
skeleton_animation_mix("attack1", "Jump-rise", 0.2);
skeleton_animation_mix("attack1", "Jump-InAir", 0.2);
//skeleton_animation_mix("attack1", "Jump-fall", 0.2);
////Jump-rise
skeleton_animation_mix("Jump-rise", "Jump-InAir", 0.1);
skeleton_animation_mix("Jump-rise", "Jump-fall", 0.1);
skeleton_animation_mix("Jump-rise", "Jump-attackAir", 0.1);
////Jump-fall
skeleton_animation_mix("Jump-fall", "Jump-rise", 0.2);
skeleton_animation_mix("Jump-fall", "Jump-InAir", 0.2);
skeleton_animation_mix("Jump-fall", "run", 0.2);
//skeleton_animation_mix("Jump-fall", "attack1", 0.2);
////Jump-inAir
skeleton_animation_mix("Jump-InAir", "Jump-fall", 0.2);
//skeleton_animation_mix("Jump-InAir", "Jump-rise", 0.2);
skeleton_animation_mix("Jump-InAir", "run", 0.1);
skeleton_animation_mix("Jump-InAir", "idle", 0.2);
//skeleton_animation_mix("Jump-InAir", "Jump-attackAir", 0.2);
////Jump-landStand
//skeleton_animation_mix("Jump-landRun", "Jump-rise", 0.2);
//skeleton_animation_mix("Jump-landRun", "Jump-InAir", 0.2);
////Jump-landRun
//skeleton_animation_mix("Jump-landStand", "Jump-rise", 0.2);
//skeleton_animation_mix("Jump-landStand", "Jump-InAir", 0.2);
////Jump-attackAir
//skeleton_animation_mix("Jump-attackAir", "Jump-land", 0.1);

skeleton_animation_set("idle");
