var _up = keyboard_check_pressed(vk_up)
var _down = keyboard_check_pressed(vk_down)
var _confirm = keyboard_check_pressed(ord("Z"))

var _prev_pos = pos

pos += (_down - _up)
if(pos >= option_length) pos = 0
if(pos < 0) pos = option_length - 1

if(_prev_pos != pos) audio_play_sound(snd_selection, 1, 0)

option_length = array_length(option)

if(pos = option_length - 1 and _confirm) instance_destroy()