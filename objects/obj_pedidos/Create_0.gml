e_alpha = 1
next_to_player = 0

#region Pedidos
first_cd_pedido = seconds(10)
cd_pedido = seconds(20)
espera_pedido = first_cd_pedido

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
tempo_pedido = [-1, -1, -1]
clients = [-1, -1, -1]
cor_pedido = [-1, -1, -1]

action = function(){
	for(var i = array_length(pedido) - 1; i > -1; i--){
		if(pedido[i] != -1){
			if(check_inventory(pedidos[pedido[i]][0])){
				//Removendo o item
				remove_item(pedidos[pedido[i]][0])
				
				//Adiciono as balas
				global.balas += pedidos[pedido[i]][1]
				
				//Criando o efeito de balas
				var _inst = instance_create_depth(0, obj_camera.ch_current - 20, -2000, obj_get_bullets)
				_inst.balas = pedidos[pedido[i]][1]
				
				//Diminuindo os pedidos fáceis
				starting = approach(starting, 0, 1)
				
				//Tirando o cliente do array
				clients[i].served = true
				clients[i].image_blend = c_white
				clients[i] = -1
				
				//Removendo o tempo
				tempo_pedido[i] = -1
				
				//Tocando o som
				quicksound(snd_kaching)
				
				//Guardando a informação
				obj_end_screen.pedidos += 1
				
				//Removendo o pedido no fim
				pedido[i] = -1
				break
			}
		}
	}
}

#endregion