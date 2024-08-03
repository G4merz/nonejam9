width = 0
height = 0

borda = 10 //Distância da borda da caixa
espaco = 20 //Distância entre opções

pos = 0 

option = []

//Tocando o sonzinho
quicksound(snd_cook)

//Bindings
up = keyboard_check_pressed(ord("W"))
down = keyboard_check_pressed(ord("S"))
confirm = keyboard_check_pressed(ord("E"))
quit = keyboard_check_pressed(vk_escape)

//Pegando o "inventário" do player
inventory = global.inventory

option_length = array_length(option)

global.paused = true

//Adicionando um delay pra abrir o menu, assim quando o player for fazer queijo o menu ainda abre.
usable = false
alarm[0] = 5