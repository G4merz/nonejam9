if(room != rm_end) exit

draw_sprite_stretched_ext(spr_quad, 0, 0, 0, room_width, room_height, c_black, b_alpha)

#region Balas
var _balas = scribble("Balas Restantes:" + string(balas))
	.starting_format("fnt_default", c_white)
	.scale(2)

if(draw_balas) _balas.draw(20 + irandom_range(-shake_balas, shake_balas), 30)
#endregion

#region Pedidos
var _pedidos = scribble("Pedidos Entregues:" + string(pedidos))
	.starting_format("fnt_default", c_white)
	.scale(2)

if(draw_pedidos) _pedidos.draw(20 + irandom_range(-shake_pedidos, shake_pedidos), 60)
#endregion

#region Pedidos Perdidos
var _pedidos_perdidos = scribble("Pedidos Perdidos:" + string(pedidos_perdidos))
	.starting_format("fnt_default", c_white)
	.scale(2)

if(draw_pedidos_perdidos) _pedidos_perdidos.draw(20 + irandom_range(-shake_pedidos_perdidos, shake_pedidos_perdidos), 90)
#endregion

var _sprw = sprite_get_width(spr_ranks)
var _sprh = sprite_get_height(spr_ranks)
var _y = wave(_sprh / 2 + 60, _sprh / 2 + 20, 4)

if(state = 4){
	draw_sprite_ext(spr_ranks, index, room_width - _sprw / 2 - 40, _y, scale_rank, scale_rank, 0, c_white, 1)
	
	if(ended){
		var _rank_message = scribble(rank_messages[index])
			.starting_format("fnt_default", c_white)
			.scale(2)
			.wrap(350)
		
		_rank_message.draw(20, 150)
		
		draw_set_font(fnt_default)
		draw_text_color(20, room_height - 30, "ESCAPE para voltar ao menu principal.", 
		c_yellow, c_yellow, c_yellow, c_yellow, wave(.1, 1, 1))
		draw_set_font(-1)
	}
}