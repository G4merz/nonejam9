draw_set_font(fnt_default)

//Pegando as dimensões do menu de forma dinâmica
var _new_w = 0
for(var i = 0; i < option_length; i++){
	var _option_width = string_width(option[menu_level][i])
	_new_w = max(_new_w, _option_width)
}

width = _new_w + borda * 2
height = borda * 2 + string_height(option[0][0]) + (option_length - 1) * espaco

//Desenhando a caixa
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height,
0, c_white, 1)

//Desenhando as opções
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

for(var i = 0; i < option_length; i++){
	var _c = c_white
	if(pos == i) _c = c_yellow
	
	draw_text_color(x + borda, y + borda + espaco * i, option[menu_level][i],
	_c, _c, _c, _c, 1)
}

draw_set_font(-1)
draw_set_color(-1)
draw_set_halign(-1)
draw_set_valign(-1)