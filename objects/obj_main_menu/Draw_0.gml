draw_set_font(fnt_default)

//Pegando as dimensões do menu de forma dinâmica
var _new_w = 0
for(var i = 0; i < option_length; i++){
	var _option_width = string_width(option[menu_level][i])
	_new_w = max(_new_w, _option_width)
}

width = _new_w + borda * 2
height = borda * 2 + string_height(option[0][0]) + (option_length - 1) * espaco


/*Desenhando a caixa
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height,
0, c_white, 1)
*/

//Desenhando as opções
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

for(var i = 0; i < option_length; i++){
	var _c = c_white
	var _x1 = x + borda
	if(pos == i){
		_c = c_yellow
		_x1 += xoff
	}
	
	draw_text_transformed_color(_x1, y + borda + espaco * i * scale, option[menu_level][i],
	scale, scale, 0, _c, _c, _c, _c, 1)
}

draw_set_font(-1)
draw_set_color(-1)
draw_set_halign(-1)
draw_set_valign(-1)

#region Desenhando e usando os botões
var _x1 = 512
var _y1 = 416
var _x2 = _x1 + 48
var _y2 = _y1 + 48
var _esc = 1
if(point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)){
	_esc = 1.3
	if(mouse_check_button_pressed(mb_left)) audio_set_master_gain(0, !audio_get_master_gain(0))
}else{
	_esc = 1
}

draw_sprite_ext(spr_sound, !audio_get_master_gain(0), _x1, _y1, _esc, _esc, 0, c_white, 1)

var _x3 = 576
var _y3 = 416
var _x4 = _x3 + 48
var _y4 = _y3 + 48
if(point_in_rectangle(mouse_x, mouse_y, _x3, _y3, _x4, _y4)){
	_esc = 1.3
	if(mouse_check_button_pressed(mb_left)) window_set_fullscreen(!window_get_fullscreen())
}else{
	_esc = 1
}

draw_sprite_ext(spr_fullscreen, window_get_fullscreen(), _x3, _y3, _esc, _esc, 0, c_white, 1)
#endregion