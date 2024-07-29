var _up = keyboard_check_pressed(vk_up)
var _down = keyboard_check_pressed(vk_down)
var _confirm = keyboard_check_pressed(ord("Z"))

pos += (_down - _up)
if(pos >= option_length) pos = 0
if(pos < 0) pos = option_length - 1

#region Definindo tudo de acordo com o tipo do menu

#region Opções
switch(menu_type){
	#region Menu de Receitas
	case "recipe":
		option =	[
					["A", "B", "C", "Sair"], 
					["D", "E", "F", "Voltar"],
					["G", "H", "I", "Voltar"]
					]
		break
	#endregion
}
#endregion

option_length = array_length(option[menu_level])

if(_confirm){

var _prev_mnl = menu_level

#region Ações
switch(menu_type){
	#region Menu de receitas
	case "recipe":
	switch(menu_level){
			case 0:
				switch(pos){
					case 0: break
					case 1: break
					case 2: menu_level++; break
					case 3: instance_destroy(); break
				}
			break
			case 1:
				switch(pos){
					case 0: break
					case 1: break
					case 2: menu_level++; break
					case 3: menu_level--; break
				}
			break
			case 2:
				switch(pos){
					case 0: break
					case 1: break
					case 2: break
					case 3: menu_level--; break
				}
			break
	}
	break
	#endregion
}
#endregion

if(_prev_mnl != menu_level) pos = 0

}

#endregion