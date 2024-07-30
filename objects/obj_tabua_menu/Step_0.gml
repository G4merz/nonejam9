var _up = keyboard_check_pressed(vk_up)
var _down = keyboard_check_pressed(vk_down)
var _confirm = keyboard_check_pressed(ord("Z"))

pos += (_down - _up)
if(pos >= option_length) pos = 0
if(pos < 0) pos = option_length - 1

option_length = array_length(option)

if(!usable) exit //Saindo do step caso eu não consiga usar o menu

if(_confirm){

	switch(pos){
		case 0: //Chocolate
		do_recipe("Cacau", itens.chocolate)
		break
		
		case 1: //Sair
		instance_destroy()
		break
	}

}

