//Instanciando a câmera
var _c = obj_camera

//Desenhando o shooter
draw_sprite_ext(spr_shooter_bg, 0, 0, 0, 1, 1, 0, c_white, alpha) //Background

#region Desenhando todas as entidades (não comentei por preguiça mesmo)
var _dlist = ds_list_create()
for(var i = 0; i < instance_number(obj_shooter_entity); i++){
	var _inst = instance_find(obj_shooter_entity, i)
	if(ds_list_size(_dlist) = 0){
		ds_list_add(_dlist, _inst)
	}else{
		for(var j = 0; j < ds_list_size(_dlist); j++){
			if(_inst.y < _dlist[| j].y){
				ds_list_insert(_dlist, j, _inst)
				break
			}
		}
		
		if(ds_list_find_index(_dlist, _inst) = -1) ds_list_add(_dlist, _inst)
	}
}

for(var i = 0; i < ds_list_size(_dlist); i++){
	var _inst2 = _dlist[| i]
	_inst2.draw()
	//Hitboxes
	//draw_rectangle(_inst2.x - sprite_get_width(_inst2.sprite) / 2, _inst2.y - sprite_get_height(_inst2.sprite), _inst2.x + sprite_get_width(_inst2.sprite) / 2, _inst2.y, false)
}

ds_list_destroy(_dlist)
#endregion

draw_sprite_ext(spr_shooter_fg, 0, 0, 0, 1, 1, 0, c_white, alpha) //Frontground

draw_sprite_ext(spr_mira, 0, mirax, miray, 2, 2, 0, c_white, alpha) //Mira

#region Arma

var _xoff_arma = 20 + ((mirax - _c.cw_current / 2) / (_c.cw_current / 2)) * 40
var _yoff_arma = 30 + ((miray - _c.ch_current / 2) / (_c.ch_current / 2)) * 40
var _xarma = _c.cw_current + _xoff_arma
var _yarma = _c.ch_current + _yoff_arma
var _alpha_diff = 0
if(point_in_rectangle(mirax, miray, _xarma - sprite_get_width(spr_arma), _yarma - sprite_get_height(spr_arma), _xarma, _yarma)){
	_alpha_diff = 0.5
}
draw_sprite_ext(spr_arma, 0, _xarma, _yarma, 1, 1, 0, c_white, alpha - _alpha_diff) //Arma

#endregion

#region Contadores 
var _counterw = sprite_get_width(spr_contador_balas)
var _counterh = sprite_get_height(spr_contador_balas)
var _x1 = 0
var _y1 = _c.ch_current
var _x2 = center_x - _counterw / 2
var _y2 = _counterh

//Fora do estande
draw_sprite_ext(spr_contador_balas, 0, _x1, _y1, 1, 1, 0, c_white, 1 - alpha) 

//Dentro do estande
draw_sprite_ext(spr_contador_balas, 1, _x2, _y2, 1, 1, 0, c_white, alpha) 

//Desenhando os números
//Valores
var _cent = floor(global.balas/100)
var _dez = floor(global.balas/10)
var _un = global.balas //(sim eu sei que essa variável é basicamente inútil)

//Posições
var _xoff = [96, 132, 168]
var _yoff = 24

draw_sprite_ext(spr_fonte_balas, _cent, _x1 +_xoff[0], _y1 - _yoff, 1, 1, 0, c_white, 1 - alpha)
draw_sprite_ext(spr_fonte_balas, _dez, _x1 +_xoff[1], _y1 - _yoff, 1, 1, 0, c_white, 1 - alpha)
draw_sprite_ext(spr_fonte_balas, _un, _x1 +_xoff[2], _y1 - _yoff, 1, 1, 0, c_white, 1 - alpha)

draw_sprite_ext(spr_fonte_balas, _cent, _x2 +_xoff[0], _y2 - _yoff, 1, 1, 0, c_white, alpha)
draw_sprite_ext(spr_fonte_balas, _dez, _x2 +_xoff[1], _y2 - _yoff, 1, 1, 0, c_white, alpha)
draw_sprite_ext(spr_fonte_balas, _un, _x2 +_xoff[2], _y2 - _yoff, 1, 1, 0, c_white, alpha)

#endregion