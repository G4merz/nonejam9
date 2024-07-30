var _up = keyboard_check_pressed(vk_up)
var _down = keyboard_check_pressed(vk_down)
var _confirm = keyboard_check_pressed(ord("Z"))

var _prev_pos = pos

pos += (_down - _up)
if(pos >= option_length) pos = 0
if(pos < 0) pos = option_length - 1

if(_prev_pos != pos) audio_play_sound(snd_selection, 1, 0)

option_length = array_length(option)

if(!usable) exit //Saindo do step caso eu não consiga usar o menu

if(_confirm){

	switch(pos){
		case 0: //Chocolate
		do_recipe("Cacau", itens.chocolate)
		break
		
		case 1: //Pão Cortado
		do_recipe("Pao", itens.pao_cortado)
		break
		
		case 2: //Tomate Cortado
		do_recipe("Tomate", itens.tomate_cortado)
		break
		
		case 3: //Sair
		instance_destroy()
		break
	}

}

