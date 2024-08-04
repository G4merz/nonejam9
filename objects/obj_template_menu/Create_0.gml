width = 0
height = 0

borda = 10 //Distância da borda da caixa
espaco = 18 //Distância entre opções

pos = 0 
menu_level = 0

option =	[

			["A", "B", "C", "Sair"], 
			["D", "E", "F", "Voltar"],
			["G", "H", "I", "Voltar"]
			
			]
			
option_length = array_length(option)

//Tocando o sonzinho
quicksound(snd_cook)

//Bindings
up = keyboard_check_pressed(ord("W"))
down = keyboard_check_pressed(ord("S"))
confirm = keyboard_check_pressed(ord("E"))
confirm_2 = mouse_check_button_pressed(mb_left)
quit = keyboard_check_pressed(vk_escape)

hovering = true //Se o mouse está em cima de alguma opção ou não

//Adicionando um delay pra abrir o menu, assim quando o player for fazer queijo o menu ainda abre.
usable = false
alarm[0] = 5

global.paused = true