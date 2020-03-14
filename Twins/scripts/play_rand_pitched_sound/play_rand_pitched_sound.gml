var sound = argument0;
var volume = argument1;

var sound_index = audio_play_sound(sound, 2, 0);
audio_sound_pitch(sound_index, random_range(.5, 1))
audio_sound_gain(sound_index, volume, 0);