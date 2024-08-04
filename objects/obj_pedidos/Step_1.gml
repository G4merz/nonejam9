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
		
		espera_pedido = seconds(irandom_range(1, 1))
		quicksound(snd_sino_pedido)
		#region Rodando uma verificação nos clientes para não adicionar um de cor repetida
		var _c = spr_cliente_vermelho
		
		for(var j = 0; j < ds_list_size(clientes); j++){
			if(clientes[| j] == spr_cliente_vermelho){
				_c = spr_cliente_azul
			}else if(clientes[| j] == spr_cliente_azul){
				_c = spr_cliente_verde
			}else if(clientes[| j] == spr_cliente_verde){
				_c = spr_cliente_vermelho
			}
		}
		
		ds_list_add(clientes, _c)
		#endregion
		break
	}
}


//Diminuindo o cooldown
for(var i = 0; i < array_length(pedido); i++){
	if(pedido[i] = -1 and !global.paused){
		espera_pedido = approach(espera_pedido, 0, 1)
		break
	}
}