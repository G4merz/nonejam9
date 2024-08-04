//Copiando a lista para ter só os nomes dos itens e organizando ela em ordem alfabética
for(var i = 0; i < ds_list_size(global.inventory); i++){
	ds_list_add(inv, global.inventory[| i].nome)
}
//ds_list_sort(inv, true)

//Pegando a câmera
var _c = obj_camera

//Texto de inventário cheio
var _inv_full_text = "Inventário Cheio!"

//Desenhando tudo
var _espaco = 30
var _width = 0

#region Caixa atrás do texto
for(var i = 0; i < ds_list_size(inv); i++){
	var _x = _c.cw_current - _espaco
	
	var _increase_box = false
	//Desenhando texto de inventário cheio
	if((ds_list_size(inv) = global.max_inventory)){
		_increase_box = true
	}
	var _y = 50 + _espaco * (i + _increase_box)
	
	var _string_width = string_width(inv[| i])
	if(_increase_box) _string_width = string_width(_inv_full_text)
	_width = max(_width, _string_width)
	
	
	if(i = ds_list_size(inv) - 1){
		draw_set_alpha(.25)
		draw_set_color(c_black)
		draw_rectangle(_x - _espaco - _width, 50 - _espaco, _x + _espaco / 2, _y + _espaco / 2, false)
		draw_set_alpha(1)
		draw_set_color(-1)
	}
}
#endregion

#region Textos
for(var i = 0; i < ds_list_size(inv); i++){
	var _x = _c.cw_current - _espaco
	var _y = 50 + _espaco * i
	
	var _spr_scale = 1.3
	var _sprw = sprite_get_width(spr_ingredientes) * _spr_scale
	
	draw_sprite_ext(spr_ingredientes, global.inventory[| i].index, _x, _y, _spr_scale, _spr_scale, 0, c_white, 1)
	
	#region Corrigindo nomes sem acento
	var _nome = inv[| i]
	switch(_nome){
		case "Pao": _nome = "Pão"; break;
		case "Macarrao": _nome = "Macarrão"; break;
		case "Hamburguer": _nome = "Hambúrguer"; break;
	}
	#endregion
	
	draw_set_halign(fa_right)
	draw_set_valign(fa_bottom)
	draw_set_font(fnt_default)
	draw_text(_x - _sprw, _y, _nome)
	
	//Desenhando texto de inventário cheio
	if((ds_list_size(inv) = global.max_inventory)
	and i = ds_list_size(inv) - 1){
		var _y2 = 50 + _espaco * (i + 1)
		draw_set_color(c_red)
		draw_text(_x, _y2, _inv_full_text)
		draw_set_color(-1)
	}
	
	draw_set_halign(-1)
	draw_set_valign(-1)
	draw_set_font(-1)
}
#endregion

//Limpando a lista ao fim do evento
ds_list_clear(inv)