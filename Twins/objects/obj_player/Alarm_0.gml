/// @description Insert description here
// You can write your code in this editor

if status == "deflect" {
	status = "parry_end";
	image_speed = 1;
	current_animation = "parry_end";
	player_apply_animation();
}