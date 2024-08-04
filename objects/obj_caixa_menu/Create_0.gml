width = 0
height = 0

width_2 = 0
height_2 = 0

scale_x = 1

borda_fora = 20
borda = 10 //Distância da borda da caixa
espaco = 18 //Distância entre opções

pos = 0 

caixa_option = ds_list_create()
player_option = ds_list_create()

caixa_option_length = ds_list_size(caixa_option)
player_option_length = ds_list_size(player_option)

cur_inventory = 0

//Tocando o sonzinho
quicksound(snd_bau_abrindo)

//Bindings
confirm = mouse_check_button_pressed(mb_left)
quit = keyboard_check_pressed(vk_escape)

hovering = false //Se o mouse está em cima de alguma opção do primeiro menu
hovering_2 = false //Se o mouse está em cima de alguma opção do segundo menu

//Adicionando um delay pra abrir o menu, assim quando o player for fazer queijo o menu ainda abre.
usable = false
alarm[0] = 5

global.paused = true

copy_lists = function(){
	//Definindo minhas listas
	ds_list_copy(caixa_option, obj_caixa.caixa)
	ds_list_copy(player_option, global.inventory)
}

store_item = function(){
	if(!ds_list_empty(global.inventory)){
		var _item = global.inventory[| pos]
	
		global.inventory[| pos].estado = item_states.stored
		ds_list_delete(global.inventory, pos)
	
		ds_list_add(obj_caixa.caixa, _item)
		ds_list_sort(obj_caixa.caixa, true)
		
		quicksound(snd_poof)
	}
}

retrieve_item = function(){
	if(!ds_list_empty(obj_caixa.caixa)){
		var _item = obj_caixa.caixa[| pos]
	
		obj_caixa.caixa[| pos].estado = item_states.dropped
		obj_caixa.caixa[| pos].play_sound = true
		obj_caixa.caixa[| pos].x = obj_chefinho.x
		obj_caixa.caixa[| pos].y = obj_chefinho.y
	
		ds_list_delete(obj_caixa.caixa, pos)
	}
}