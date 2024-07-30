width = 0
height = 0

borda = 10 //Distância da borda da caixa
espaco = 20 //Distância entre opções

pos = 0 

option = ["Chocolate", "Pão Cortado", "Tomate Cortado", "Sair"]

//Pegando o "inventário" do player
inventory = obj_chefinho.picked_items

option_length = array_length(option)

global.paused = true

//Adicionando um delay pra abrir o menu, assim quando o player for fazer queijo o menu ainda abre.
usable = false
alarm[0] = 3

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

	//Primeiro, faço a checagem dos ingredientes.
	var _checked = 0
	for(var i = 0; i < argument_count - 1; i++){
		if(check_inventory(argument[i])) _checked++
	}
	
	//Depois, verifico se todos estão presentes
	if(floor(_checked / (argument_count - 1)) == true){
		//Removo os itens necessários
		for(var i = 0; i < argument_count - 1; i++){
			remove_item(argument[i])
		}
		
		//E adiciono o resultado
		add_item(argument[argument_count - 1])
	}else{
		//Se a checagem não foi positiva, retorno false
		return false
	}
}