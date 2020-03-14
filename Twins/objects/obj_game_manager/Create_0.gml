/// @description Insert description here
// You can write your code in this editor
global.sleepScale = 2;
view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);
shake = false;
hit = false;
alarm[0] = 250;
alarm[1] = 10;



audio_play_sound(snd_battle_music, 100, 1);
