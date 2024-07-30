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
		case 0: //Pão
		do_recipe("Massa", itens.pao)
		break	
		
		case 1: //Queijo
		do_recipe("Leite", itens.queijo)
		break
		
		case 2: //Carne Assada
		do_recipe("Carne Crua", itens.carne_assada)
		break
		
		case 3: //Bolo
		do_recipe("Massa", "Manteiga", "Leite", itens.bolo)
		break
		
		case 4: //Bolo de Chocolate
		do_recipe("Massa", "Manteiga", "Leite", "Chocolate", itens.bolo_chocolate)
		break
		
		case 5: //Pizza
		do_recipe("Massa", "Molho", "Carne Assada", "Queijo", itens.pizza)
		break
		
		case 6: //Macarrão
		do_recipe("Massa", "Molho", itens.macarrao)
		break
		
		case 7: //Sair
		instance_destroy()
		break
	}

}

