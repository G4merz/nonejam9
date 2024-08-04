draw_self()

//Desenhando o botão de interagir quando o player está perto
if(next_to_player and !global.paused){
	var _x = x + sprite_width / 2
	var _y = wave(y - 10, y - 25, 3)
	draw_sprite_ext(spr_interagir, 0, _x, _y, 0.5, 0.5, 0, c_white, e_alpha)
}

//Desenhando os pedidos
for(var i = 0; i < array_length(pedido); i++){
	var _sprw = sprite_width
	var _sprh = sprite_height
	var _x = x + 3 + (_sprw / 2) * i
	var _y = [wave(y - 55, y - 40, 5), wave(y - 50, y - 35, 5), wave(y - 55, y - 40, 5)]
	var _y2 = [y - 25, y - 24, y - 27]
	
	if(pedido[i] != -1){
		draw_sprite_ext(spr_balao, 0, _x, _y[i] + 5, 1, 1, 0, cor_pedido[i], 1)
		draw_sprite_ext(spr_ingredientes, pedidos[pedido[i]][2], _x, _y[i], 1, 1, 0, cor_pedido[i], 1)
		draw_sprite_ext(spr_papeis_pedido, i, _x, _y2[i], 1, 1, 0, c_white, 1)
	}
}

/*Desenhando os clientes
for(var i = 0; i < ds_list_size(clientes); i++){
	draw_sprite_ext(clientes[| i], 1, x + sprite_width / 2, y + 45 + 7 * i, 1, 1, 0, c_white, 1)
}
*/