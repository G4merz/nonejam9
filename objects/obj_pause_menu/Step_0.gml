up = keyboard_check_pressed(ord("W"))
down = keyboard_check_pressed(ord("S"))
confirm = keyboard_check_pressed(ord("E"))
confirm_2 = mouse_check_button_pressed(mb_left)
quit = keyboard_check_pressed(vk_escape)

var _prev_pos = pos

pos += (down - up)
if(pos >= option_length) pos = 0
if(pos < 0) pos = option_length - 1

#region Fazendo com que seja possível selecionar e clicar com o mouse
for(var i = 0; i < option_length; i++){
	var _prev_pos_2 = pos

	var _x1 = x + borda
	var _y1 = y + borda + espaco * i
	var _x2 = x + width
	var _y2 = _y1 + string_height(option[menu_level][pos])
	
	if(point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)){
		pos = i
		hovering = true
	}else{
		hovering = false
	}
	
	if(_prev_pos_2 != pos){
		audio_play_sound(snd_selection, 1, 0)
		_prev_pos = pos
	}
	if(hovering) break //Se eu já estiver com o mouse em cima de algo, não rodo novamente.

}
#endregion

if(_prev_pos != pos) audio_play_sound(snd_selection, 1, 0)

option_length = array_length(option[menu_level])

if(quit and usable) instance_destroy()

if(confirm or (confirm_2 and hovering)){

	var _prev_mnl = menu_level

	switch(menu_level){
		case 0:
			switch(pos){
				case 0: instance_destroy(); break
				case 1: obj_sys.tempo = 0; instance_destroy(); break
			}
		break

	}

	if(_prev_mnl != menu_level) pos = 0

}