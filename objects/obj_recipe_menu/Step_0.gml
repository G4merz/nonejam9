var _left = keyboard_check_pressed(ord("A"))
var _right = keyboard_check_pressed(ord("D"))
var _quit = keyboard_check_pressed(vk_escape)

var _prev_pos = pos

pos += (_right - _left)
if(pos >= option_length) pos = option_length - 1
if(pos < 0) pos = 0

if(_prev_pos != pos) quicksound(choose(snd_livro, snd_livro2))

option_length = array_length(option)

if(_quit) instance_destroy()