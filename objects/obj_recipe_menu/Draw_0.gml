/*
draw_set_font(fnt_default)

//Pegando as dimensões do menu de forma dinâmica
var _new_w = 0
for(var i = 0; i < option_length; i++){
	var _option_width = string_width(option[i])
	_new_w = max(_new_w, _option_width)
}

width = _new_w + borda * 2
height = borda * 2 + string_height(option[0]) + (option_length - 1) * espaco

//Ajustando o y para ficar centralizado
//y = 240 - (height / 2)

//Desenhando a caixa
draw_sprite_ext(spr_menu, 0, x, y, width/sprite_width, height/sprite_height,
0, c_white, 1)

//Desenhando a caixa de descrições
var _desc_box_x = x
var _desc_box_y = max(360, y + height + espaco)
var _descw = room_width - 40
var _desch = -(_desc_box_y - room_height + 20)

draw_sprite_stretched_ext(spr_menu, 0, _desc_box_x, _desc_box_y, 
_descw, _desch, c_white, 1)

//Desenhando as opções
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

for(var i = 0; i < option_length; i++){
	var _c = c_white
	if(pos == i) _c = c_yellow
	
	draw_text_color(x + borda, y + borda + espaco * i, option[i],
	_c, _c, _c, _c, 1)
}

draw_set_font(-1)
draw_set_color(-1)
draw_set_halign(-1)
draw_set_valign(-1)

//Desenhando a descrição
var _desc = scribble(description[pos])
	.starting_format("fnt_default", c_white)
	.wrap(_descw - borda)
	
_desc.draw(_desc_box_x + borda, _desc_box_y + borda)
*/

var _cw = obj_camera.cw_current
var _ch = obj_camera.ch_current
draw_sprite_ext(spr_receitas, pos, 20, 20, 1, 1, 0, c_white, 1)
draw_sprite_ext(spr_seta, (pos = 0) ? 1 : 0, 26, _ch / 2, 1, 1, 0, c_white, 1)
draw_sprite_ext(spr_seta, (pos = option_length - 1) ? 1 : 0, _cw - 26, _ch / 2, -1, 1, 0, c_white, 1)