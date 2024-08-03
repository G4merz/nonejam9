up = keyboard_check_pressed(ord("W"))
down = keyboard_check_pressed(ord("S"))
confirm = keyboard_check_pressed(ord("E"))
quit = keyboard_check_pressed(vk_escape)

var _prev_pos = pos

pos += (down - up)
if(pos >= option_length) pos = 0
if(pos < 0) pos = option_length - 1

if(_prev_pos != pos) audio_play_sound(snd_selection, 1, 0)

option_length = array_length(option)

if(quit) instance_destroy()