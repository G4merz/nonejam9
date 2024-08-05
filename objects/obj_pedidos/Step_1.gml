depth = -y - 10

//Se eu estiver a 1 pixel de distância do player e a tecla "Z" for apertada, o menu abre.
with(obj_chefinho){
	other.next_to_player = place_meeting(x + lengthdir_x(1, olhando*90), y + lengthdir_y(1, olhando*90), other)
	
	if(other.next_to_player
	and keyboard_check_pressed(ord("E"))
	and !global.paused){
		other.action()
	}
}

e_alpha = approach(e_alpha, next_to_player, 0.1)

//Adicionando um pedido e um cliente quando o cooldown acabar
for(var i = 0; i < array_length(pedido); i++){
	if(pedido[i] = -1 and espera_pedido = 0){
		if(starting > 0) pedido[i] = irandom(3)
		else pedido[i] = irandom(array_length(pedidos) - 1)
		
		espera_pedido = cd_pedido
		quicksound(snd_sino_pedido)
		
		//Redefinindo tempo do pedido
		tempo_pedido[i] = seconds(60)

		//Adicionando cliente
		clients[i] = instance_create_depth(x + 3 + (sprite_width / 2) * i, y + 50, depth - 10, obj_cliente)
		clients[i].type = 0 //irandom(clientes.peixe)
		break
	}
}

//Diminuindo o cooldown entre pedidos
for(var i = 0; i < array_length(pedido); i++){
	if(pedido[i] = -1 and !global.paused){
		espera_pedido = approach(espera_pedido, 0, 1)
		break
	}
}

//Diminuindo o tempo dos pedidos
for(var i = 0; i < array_length(pedido); i++){
	if(tempo_pedido[i] != -1 and !global.paused){
		tempo_pedido[i] = approach(tempo_pedido[i], 0, 1)
		
		cor_pedido[i] = make_color_rgb(255, ((tempo_pedido[i] / seconds(30))) * 255, ((tempo_pedido[i] / seconds(30))) * 255)
		clients[i].image_blend = cor_pedido[i]
		
		//Tirando o pedido caso o tempo acabe
		if(tempo_pedido[i] = 0){
				//Tirando o cliente do array
				clients[i].served = true
				clients[i] = -1
				
				//Removendo o tempo
				tempo_pedido[i] = -1
				
				//Removendo o pedido
				pedido[i] = -1
				
				//Guardando a informação
				obj_end_screen.pedidos_perdidos += 1
				break
		}
	}
}