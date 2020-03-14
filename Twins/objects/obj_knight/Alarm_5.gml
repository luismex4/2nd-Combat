/// @description reset anim after hit
// You can write your code in this editor

if status == "hit" {
	status = "idle";
	image_speed = 1;
	skeleton_animation_set_frame(0, 5);
	stunned = false;
	vulnerable_heights[0] = true;
	vulnerable_heights[1] = false;
	vulnerable_heights[2] = true;
	hit_times = 0;
}