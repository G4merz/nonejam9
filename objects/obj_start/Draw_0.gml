if(state = "started"){
	draw_sprite_ext(spr_logo, 0, 32, 32, 1.5, 1.5, 0, c_white, 1)
}

draw_set_color(c_black)
draw_set_alpha(b_alpha)
draw_rectangle(0, 0, room_width, room_height, false)
draw_set_alpha(1)
draw_set_color(-1)

draw_sprite_stretched_ext(spr_intro, 0, 0, 0, room_width, room_height, c_white, intro_alpha)

#region Desenhando os bicho (código mais preguiçoso que eu já fiz)
if(state = "logo"){
index += 6 / FPS
var _cur_chef_x = chef_x - pos * 2
draw_sprite_ext(spr_sombra, 0, _cur_chef_x, 400, -1.5, 1.5, 0, c_white, .5)
draw_sprite_ext(spr_chefinho_walk_side, index, _cur_chef_x, 400, -2, 2, 0, c_white, 1)

draw_sprite_ext(spr_sombra, 0, _cur_chef_x + 500, 380, -3.2, 2, 0, c_white, .5)
draw_sprite_ext(spr_vaca_preta_walk, index, _cur_chef_x + 500, 380, -2, 2, 0, c_white, 1)
draw_sprite_ext(spr_sombra, 0, _cur_chef_x + 530, 420, -3.2, 2, 0, c_white, .5)
draw_sprite_ext(spr_vaca_marrom_walk, index, _cur_chef_x + 530, 420, -2, 2, 0, c_white, 1)

draw_sprite_ext(spr_sombra, 0, _cur_chef_x + 680, 410, -1.3, 1.3, 0, c_white, .5)
draw_sprite_ext(spr_galinha_branca_walk, index, _cur_chef_x + 680, 410, -2, 2, 0, c_white, 1)
draw_sprite_ext(spr_sombra, 0, _cur_chef_x + 730, 415, -1.3, 1.3, 0, c_white, .5)
draw_sprite_ext(spr_galinha_preta_walk, index, _cur_chef_x + 730, 415, -2, 2, 0, c_white, 1)

draw_sprite_ext(spr_sombra, 0, _cur_chef_x + 880, 390, -3.4, 2.5, 0, c_white, .5)
draw_sprite_ext(spr_cacau_walk, index, _cur_chef_x + 880, 390, -2, 2, 0, c_white, 1)
draw_sprite_ext(spr_sombra, 0, _cur_chef_x + 1080, 390, -3.2, 2, 0, c_white, .5)
draw_sprite_ext(spr_tomate_walk, index, _cur_chef_x + 1080, 390, -2, 2, 0, c_white, 1)
draw_sprite_ext(spr_sombra, 0, _cur_chef_x + 960, 420, -1.6, 1.6, 0, c_white, .5)
draw_sprite_ext(spr_trigo_walk, index, _cur_chef_x + 960, 420, -2, 2, 0, c_white, 1)
}
#endregion