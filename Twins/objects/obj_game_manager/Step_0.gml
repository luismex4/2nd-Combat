/// @description Insert description here
// You can write your code in this editor
global.sleepAcc = 0;

if shake {
	var rand_x = random_range(-5,5);
	var rand_y = random_range(-5,5);
	view_x = camera_get_view_x(view_camera[0]);
	view_y = camera_get_view_y(view_camera[0]);
	camera_set_view_pos(view_camera[0],view_x + rand_x, view_y + rand_y);
}

if hit {
	var rand_x = random_range(-2,2);
	var rand_y = random_range(-2,2);
	view_x = camera_get_view_x(view_camera[0]);
	view_y = camera_get_view_y(view_camera[0]);
	camera_set_view_pos(view_camera[0],view_x + rand_x, view_y + rand_y);
	hit = false;
}