if(sequence != -1){
	if(layer_sequence_get_headpos(sequence) == 59){
		audio_stop_sound(msc_main_menu)
		room_goto(rm_game)
	}
}

if(!usable) exit

up = keyboard_check_pressed(vk_up)
down = keyboard_check_pressed(vk_down)
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
	var _y1 = y + borda + espaco * i * scale
	var _x2 = x + width * scale
	var _y2 = _y1 + string_height(option[menu_level][i]) * scale
	
	if(point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)){
		pos = i
		hovering = true
	}else{
		hovering = false
	}
	
	if(_prev_pos_2 != pos){
		audio_play_sound(snd_selection, 1, 0)
		xoff = 0
		_prev_pos = pos
	}
	if(hovering) break //Se eu já estiver com o mouse em cima de algo, não rodo novamente.

}
#endregion

xoff = lerp(xoff, 30, 0.2)

if(_prev_pos != pos){
	audio_play_sound(snd_selection, 1, 0)
	xoff = 0
}

if(quit) instance_destroy()

if(confirm or (confirm_2 and hovering)){

	var _prev_mnl = menu_level
	
	quicksound(snd_select); 
	
	switch(menu_level){
		case 0:
			switch(pos){
				case 0: menu_level++; break
				case 1: usable = false; instance_create_layer(0, 0, "Instances", obj_creditos); break
				case 2: game_end(); break
			}
		break
		case 1:
			switch(pos){
				case 0: start_game(0); break
				case 1: start_game(1); break
				case 2: start_game(2); break
				case 3: start_game(3); break
				case 4: menu_level--; break
			}
		break

	}
	
	if(_prev_mnl != menu_level) pos = 0

}

option_length = array_length(option[menu_level])