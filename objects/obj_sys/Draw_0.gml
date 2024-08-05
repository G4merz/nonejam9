if(global.paused and tempo > 0){
	draw_sprite_stretched_ext(spr_quad, 0, 0, 0, room_width, room_height, c_black, 0.5)
}

var _ind = (1 - (tempo / max_tempo)) * 10 - 1
draw_sprite(spr_tempo, max(0, _ind), room_width - 58, room_height - 58)

draw_set_color(c_white)
draw_set_font(fnt_default)
var _sec = floor(tempo / FPS)
var _min = _sec div 60

var _add_zero = (_sec % 60 < 10) ? "0" : ""

draw_text(room_width - 53, room_height - 80, string(_min) + ":" + _add_zero + string(_sec % 60))
draw_set_color(-1)
draw_set_font(-1)

if(tempo = 0){
	alpha += 0.01
	draw_sprite_stretched_ext(spr_quad, 0, 0, 0, room_width, room_height, c_black, alpha)
}