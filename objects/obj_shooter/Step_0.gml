//Centro da tela (pra facilitar)
center_x = obj_camera.cw_current / 2
center_y = obj_camera.ch_current / 2

//Mudando o alpha de acordo com se estou no modo de tiro ou não
alpha = approach(alpha, (global.shooting) ? 1 : 0, 0.1)

//Saindo do modo de tiro caso eu esteja nele
if(keyboard_check_pressed(vk_escape) and global.shooting_delay = 0 and global.shooting){
	quit_shooter()
}

//Diminuindo o delay
global.shooting_delay = approach(global.shooting_delay, 0, 1)

//Mudando a posição da mira
mirax = lerp(mirax, mouse_x, 0.4)
miray = lerp(miray, mouse_y, 0.4)

#region Mira e tiros

//Se eu estiver no modo de tiro, escondo o mouse
if(global.shooting) window_set_cursor(cr_none)
else window_set_cursor(cr_arrow)

var _tiro = mouse_check_button_released(mb_left) //Botão do tiro
array_insert_shift(shot_input_array, 0, _tiro)

//Se eu estiver no modo de tiro e atirar, rodo o código abaixo
if(shot_input() and global.shooting 
and espera_tiro = 0 and global.balas > 0){
	audio_play_sound(snd_tiro, 1, 0)
	espera_tiro = tempo_tiro
	global.balas--
	played = false
	array_resize(shot_input_array, 0)
	
	#region Checando quais entidades estão no lugar da mira e dando dano apenas na mais em cima
	var _list = ds_list_create()
	var _pos = instance_position_list(mirax, miray, obj_shooter_entity, _list, false)
	var _damaged_inst = noone
	for(var i = 0; i < ds_list_size(_list); i++){
		if((_damaged_inst = noone or _damaged_inst.y < _list[| i].y) 
		and _list[| i].shooting_mode = global.shooting){
			_damaged_inst = _list[| i]
		}
	}
	
	//Se a instancia existir, dou dano nela. 
	if(_damaged_inst != noone){
		_damaged_inst.vida--
	}
	
	ds_list_destroy(_list)
	#endregion
}

//Diminuindo o cooldown
espera_tiro = approach(espera_tiro, 0, 1)
if(espera_tiro <= seconds(.55) and !played and global.balas > 0) {
	quicksound(snd_recarga)
	played = true
}

//if(keyboard_check_pressed(vk_space)) global.balas++

#endregion

#region Sumonando entidades

//Se eu estiver no modo de tiro e atirar, rodo o código abaixo
if(espera_entidade = 0){
	var _obj, _obj_type, _dir, _ex, _ey
	_obj_type = choose("animal", "planta")
	switch(_obj_type){
		case "animal": _obj = choose(obj_vaca, obj_galinha); break
		case "planta": _obj = choose(obj_cacau, obj_trigo, obj_tomate); break
	}
	_dir = choose(-1, 1)
	_ex = (_dir > 0) ? -50 : room_width + 50
	_ey = irandom_range(room_height / 2, room_height - 65)
	
	var _inst = instance_create_depth(_ex, _ey, depth, _obj)
	_inst.dir = _dir
	
	espera_entidade = tempo_entidade
}

//Diminuindo o cooldown
espera_entidade = approach(espera_entidade, 0, 1)

#endregion