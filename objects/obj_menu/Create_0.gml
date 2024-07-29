width = 0
height = 0

borda = 10 //Distância da borda da caixa
espaco = 18 //Distância entre opções

pos = 0 
menu_level = 0

option = []
menu_type = "noone"
			
option_length = array_length(option)

global.paused = true

change_type = function(_type){
	if(menu_type = "recipe") obj_livro_receitas.lendo = false
	
	menu_type = _type
}
