e_alpha = 1
next_to_player = 0

#region Pedidos
cd_pedido = seconds(5)
espera_pedido = cd_pedido

starting = 2

//Lista de pedidos e suas recompensas [nome da comida, recompensa de balas, enum do item]
pedidos =	[
			["Carne Assada", 6, itens.carne_assada],
			["Chocolate", 6, itens.chocolate],
			["Nescau", 9, itens.nescau],
			["Pao", 12, itens.pao],
			["Bolo", 18, itens.bolo],
			["Macarrao", 21, itens.macarrao],
			["Bolo de Chocolate", 24, itens.bolo_chocolate],
			["Pizza", 27, itens.pizza],
			["Hamburguer", 27, itens.burguer],
]

pedido = [-1, -1, -1]
clientes = ds_list_create()

action = function(){
	for(var i = array_length(pedido) - 1; i > -1; i--){
		if(pedido[i] != -1){
			if(check_inventory(pedidos[pedido[i]][0])){
				remove_item(pedidos[pedido[i]][0])
				global.balas += pedidos[pedido[i]][1]
				pedido[i] = -1
				starting = approach(starting, 0, 1)
				ds_list_delete(clientes, ds_list_size(clientes) - 1)
				quicksound(snd_kaching)
				break
			}
		}
	}
}

#endregion