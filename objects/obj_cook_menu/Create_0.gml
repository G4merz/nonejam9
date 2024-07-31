width = 0
height = 0

borda = 10 //Distância da borda da caixa
espaco = 20 //Distância entre opções

pos = 0 

option = []

//Tocando o sonzinho
quicksound(snd_cook)

//Pegando o "inventário" do player
inventory = obj_chefinho.picked_items

option_length = array_length(option)

global.paused = true

//Adicionando um delay pra abrir o menu, assim quando o player for fazer queijo o menu ainda abre.
usable = false
alarm[0] = 5

//Função para checar se tem algum item
check_inventory = function(){
	var _item_existe = 0
	for(var i = 0; i < ds_list_size(inventory); i++){
		for(var j = 0; j < argument_count; j++){
			if(inventory[| i].nome == argument[j]){
				_item_existe++
			}
		}
	}
	
	return floor(_item_existe / argument_count)
}

//Função para adicionar um item ao inventário com base na enum "itens"
add_item = function(_index){
	var _inst = instance_create_layer(obj_chefinho.x, obj_chefinho.y, "itens", obj_item)
	_inst.index = _index
	ds_list_add(inventory, _inst)
}

//Função para remover um item do inventário pelo nome (remove o primeiro de cima para baixo)
remove_item = function(){
	for(var i = ds_list_size(inventory) - 1; i > -1; i--){
		for(var j = 0; j < argument_count; j++){
			if(inventory[| i].nome == argument[j]){
				instance_destroy(inventory[| i])
				ds_list_delete(inventory, i)
				return
			}
		}
	}
}

//Função que faz uma receita de uma vez só
do_recipe = function(){
	//Definindo minhas variáveis
	var _arg_off = (asset_get_type(argument[argument_count - 1]) == asset_sound) + 1
	var _checked = 0
	var _ingred_count = argument_count - _arg_off
	var _result = _ingred_count
	
	var _sound = -1
	if(_arg_off = 2) var _sound = argument[argument_count - 1]
	
	//Primeiro, faço a checagem dos ingredientes.
	for(var i = 0; i < _ingred_count; i++){
		if(check_inventory(argument[i])) _checked++
	}
	
	//Depois, verifico se todos estão presentes
	if(floor(_checked / _ingred_count == true)){
		//Removo os itens necessários
		for(var i = 0; i < _ingred_count; i++){
			remove_item(argument[i])
		}
		
		//Adiciono o resultado
		add_item(argument[_result])
		
		//E por último, toco o som
		if(_sound != -1) quicksound(_sound)
	}
}