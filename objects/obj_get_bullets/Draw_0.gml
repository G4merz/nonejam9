//Desenhando os números
//Valores
var _cent = floor(balas/100)
var _dez = floor(balas/10)
var _un = balas //(sim eu sei que essa variável é basicamente inútil)

//Posições
var _xoff = [96, 132, 168]
var _yoff = 24

draw_sprite_ext(spr_fonte_balas, _cent, x +_xoff[0], y - _yoff, 1, 1, 0, c_white, image_alpha)
draw_sprite_ext(spr_fonte_balas, _dez, x +_xoff[1], y - _yoff, 1, 1, 0, c_white, image_alpha)
draw_sprite_ext(spr_fonte_balas, _un, x +_xoff[2], y - _yoff, 1, 1, 0, c_white, image_alpha)