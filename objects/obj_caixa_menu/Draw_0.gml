draw_set_font(fnt_default)

//Instanciando a câmera
var _c = obj_camera

//Pegando as dimensões do primeiro menu de forma dinâmica
var _new_w = 0
for(var i = 0; i < caixa_option_length; i++){
	var _option_width = string_width(caixa_option[| i])
	_new_w = max(_new_w, _option_width)
}

width = _new_w + borda * 2
height = borda * 2 + string_height(caixa_option[| 0]) + (caixa_option_length - 1) * espaco

//Pegando as dimensões do primeiro menu de forma dinâmica
var _new_w_2 = 0
for(var i = 0; i < player_option_length; i++){
	var _option_width = string_width(player_option[| i])
	_new_w = max(_new_w_2, _option_width)
}

width_2 = _new_w + borda * 2
height_2 = borda * 2 + string_height(player_option[| 0]) + (player_option_length - 1) * espaco

//Desenhando as caixas
if(!ds_list_empty(obj_caixa.caixa))
draw_sprite_ext(sprite_index, image_index, borda_fora, borda_fora, width/sprite_width, height/sprite_height,
0, c_white, 1)

if(!ds_list_empty(global.inventory))
draw_sprite_ext(sprite_index, image_index, _c.cw_current - borda_fora - width_2, borda_fora, 
width_2/sprite_width, height_2/sprite_height, 0, c_white, 1)

//Desenhando as opções
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

for(var i = 0; i < caixa_option_length; i++){
	var _color = c_white
	var _item = caixa_option[| i]
	if(pos == i and cur_inventory = 0) _color = c_yellow
	
	if(_item != -1){
		var _swidth = string_width(_item.nome)
		var _x = borda_fora + borda
		var _y = borda_fora + borda + espaco * i
		
		draw_text_color(_x, _y, _item.nome, _color, _color, _color, _color, 1)
		
		draw_sprite(spr_ingredientes, _item.index, _x + _swidth + 15, _y + 17)
	}
}

for(var i = 0; i < player_option_length; i++){
	var _color = c_white
	var _item = player_option[| i]
	if(pos == i and cur_inventory = 1) _color = c_yellow
	
	if(_item != -1){
		var _swidth = string_width(_item.nome)
		var _x = _c.cw_current - borda_fora - width_2 + borda
		var _y = borda_fora + borda + espaco * i
		
		draw_text_color(_x, _y, _item.nome, _color, _color, _color, _color, 1)
		
		draw_sprite(spr_ingredientes, _item.index, _x + _swidth + 15, _y + 17)
	}
}

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if(ds_list_empty(obj_caixa.caixa) and ds_list_empty(global.inventory)){
	var _a = wave(0, 1, 1)
	draw_text_transformed_color(_c.cw_current / 2, _c.ch_current / 2, "Ambos os inventários estão vazios!",
	1.5, 1.5, 0, c_white, c_white, c_white, c_white, _a)
}

draw_set_font(-1)
draw_set_color(-1)
draw_set_halign(-1)
draw_set_valign(-1)

#region Botão Sair
var _sprw = sprite_get_width(spr_sair)
var _sprh = sprite_get_height(spr_sair)

var _x = _c.cw_current / 2
var _y = _sprh / 2 + 15

if(point_in_rectangle(mouse_x, mouse_y, _x - _sprw / 2, _y - _sprh / 2, _x + _sprw / 2, _y + _sprh / 2)){
	scale_x = lerp(scale_x, 1.3, 0.05)
	if(mouse_check_button_pressed(mb_left)){
		instance_destroy()
	}
}else{
	scale_x = lerp(scale_x, 1, 0.05)
}

draw_sprite_ext(spr_sair, 0, _x, _y, scale_x, scale_x, 0, c_white, 1)

#endregion