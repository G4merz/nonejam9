//Desenhando minha sombra
//draw_sprite_ext(spr_sombra, 0, x, y - 2, .8, 1, 0, c_white, .2)
//Me desenhando
draw_sprite_ext(sprite, image_ind, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha)

//Debugando
if(debug){
	//Estado
	draw_set_halign(1)
	draw_set_valign(1)
	
	draw_text(x, y - 36, texto_estado)
	
	draw_set_halign(-1)
	draw_set_valign(-1)
}