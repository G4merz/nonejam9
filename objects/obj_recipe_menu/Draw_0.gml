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
var _cx = obj_camera.cx
var _cy = obj_camera.cy

//Desenhando a receita na tela
draw_sprite_ext(spr_receitas, pos, 20, 20, 1, 1, 0, c_white, 1)

//Desenhando os botões
var _ind = 0
var _sprw = sprite_get_width(spr_seta)
var _sprh = sprite_get_height(spr_seta)

#region Seta esquerda

var _x1 = _cx + 26
var _y1 = _cy + _ch / 2
if(point_in_rectangle(mouse_x, mouse_y, _x1 - _sprw / 2, _y1 - _sprh / 2, _x1 + _sprw / 2, _y1 + _sprh / 2)
and pos > 0){
	scale_esq = lerp(scale_esq, 1.4, 0.05)
	if(mouse_check_button_pressed(mb_left)){
		pos--
		quicksound(choose(snd_livro, snd_livro2))
	}
}else{
	scale_esq = lerp(scale_esq, 1, 0.05)
}
_ind = (pos = 0) ? 1 : 0 //Se a posição do menu for 0, a seta fica escura.
draw_sprite_ext(spr_seta, _ind, 26, _ch / 2, scale_esq, scale_esq, 0, c_white, 1)

#endregion

#region Seta direita

var _x2 = _cx + _cw - 26
var _y2 = _cy + _ch / 2
if(point_in_rectangle(mouse_x, mouse_y, _x2 - _sprw / 2, _y2 - _sprh / 2, _x2 + _sprw / 2, _y2 + _sprh / 2)
and pos < option_length - 1){
	scale_dir = lerp(scale_dir, 1.4, 0.1)
	if(mouse_check_button_pressed(mb_left)){
		pos++
		quicksound(choose(snd_livro, snd_livro2))
	}
}else{
	scale_dir = lerp(scale_dir, 1, 0.1)
}
_ind = (pos = option_length - 1) ? 1 : 0 //Se a posição do menu for a final, a seta fica escura.
draw_sprite_ext(spr_seta, _ind, _x2, _y2, scale_dir * -1, scale_dir, 0, c_white, 1)

#endregion

#region Sair
var _x3 = _cx + _sprw / 2 + 10
var _y3 = _cy + _sprw / 2 + 10

if(point_in_rectangle(mouse_x, mouse_y, _x3 - _sprw / 2, _y3 - _sprh / 2, _x3 + _sprw / 2, _y3 + _sprh / 2)){
	scale_x = lerp(scale_x, 1.4, 0.05)
	if(mouse_check_button_pressed(mb_left)){
		instance_destroy()
	}
}else{
	scale_x = lerp(scale_x, 1, 0.05)
}

draw_sprite_ext(spr_sair, 0, _x3, _y3, scale_x, scale_x, 0, c_white, 1)

#endregion