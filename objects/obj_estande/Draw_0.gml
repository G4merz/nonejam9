draw_self()

if(next_to_player and !global.paused){
	var _x = x + sprite_width / 2
	var _y = wave(y - ydiff - 5, y + ydiff, 3)
	draw_sprite_ext(spr_interagir, 0, _x, _y, 0.5, 0.5, 0, c_white, e_alpha)
}