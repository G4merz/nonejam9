draw_sprite_stretched_ext(spr_quad, 0, 0, 0, room_width, room_height, c_black, .75)

for(var i = 0; i < array_length(text); i++){
	var _texto = scribble(text[i])
		.starting_format("fnt_default", c_white)
		.align(1, 1)
		.scale(2)
		
	_texto.draw(room_width / 2, room_height / 2 - 30 + 30 * i)
}

draw_set_font(fnt_default)
draw_text_color(20, room_height - 30, "ESCAPE para voltar ao menu principal.", 
c_yellow, c_yellow, c_yellow, c_yellow, wave(.1, 1, 1))
draw_set_font(-1)

//audio_set_master_gain()