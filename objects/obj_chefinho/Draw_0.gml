//Desenhando sombra
draw_sprite_ext(spr_sombra, 0, x, y - 2, .6, .7, 0, c_white, .2)

//Desenhando as partículas enquanto eu andar
if(estado = estado_movendo){
	/*
	var _sprw = sprite_get_width(sprite)
	var _sprh = sprite_get_height(sprite)
	
	part_emitter_region(obj_sys.partsys, partem, x-_sprw, x+_sprw, y-_sprh, y+_sprh, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(obj_sys.partsys, partem, obj_sys.partype, 2);
	part_emitter_burst(obj_sys.partsys, partem, obj_sys.partype2, 3);
	*/
}
		
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