//Herdando as informações
event_inherited()
if(!usable) exit //Saindo do step caso eu não consiga usar o menu

var _up = keyboard_check_pressed(vk_up)
var _down = keyboard_check_pressed(vk_down)
var _confirm = keyboard_check_pressed(ord("Z"))

if(_confirm){

	switch(pos){
		case 0: //Farinha
		do_recipe("Trigo", itens.farinha, snd_moer)
		break
		
		case 1: //Manteiga
		do_recipe("Leite", itens.manteiga)
		break
		
		case 2: //Molho
		do_recipe("Tomate", itens.molho_tomate)
		break
		
		case 3: //Massa
		do_recipe("Farinha", "Ovo", itens.massa)
		break
		
		case 4: //Nescau
		do_recipe("Leite", "Chocolate", itens.nescau, snd_liquido)
		break
		
		case 5: //Sair
		instance_destroy()
		break
	}

}

