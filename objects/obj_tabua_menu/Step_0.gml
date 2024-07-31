//Herdando as informações
event_inherited()
if(!usable) exit //Saindo do step caso eu não consiga usar o menu

var _up = keyboard_check_pressed(vk_up)
var _down = keyboard_check_pressed(vk_down)
var _confirm = keyboard_check_pressed(ord("Z"))

if(_confirm){

	switch(pos){
		case 0: //Chocolate
		do_recipe("Cacau", itens.chocolate)
		break
		
		case 1: //Pão Cortado
		do_recipe("Pao", itens.pao_cortado)
		break
		
		case 2: //Tomate Cortado
		do_recipe("Tomate", itens.tomate_cortado, snd_cortar_tomate)
		break
		
		case 3: //Sair
		instance_destroy()
		break
	}

}

