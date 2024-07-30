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
		case 0: //Queijo
		do_recipe("Leite", itens.queijo)
		break
		
		case 1: //Carne Assada
		do_recipe("Carne Crua", itens.carne_assada)
		break
		
		case 2: //Bolo
		do_recipe("Massa", "Manteiga", "Ovo", itens.bolo)
		break
		
		case 3: //Bolo de Chocolate
		do_recipe("Massa", "Manteiga", "Ovo", "Chocolate", itens.bolo_chocolate)
		break
		
		case 4: //Pizza
		do_recipe("Massa", "Molho", "Carne Assada", "Queijo", itens.pizza)
		break
		
		case 5: //Macarrão
		//do_recipe("Massa", "Molho", itens.macarrao)
		break
		
		case 6: //Sair
		instance_destroy()
		break
	}

}

