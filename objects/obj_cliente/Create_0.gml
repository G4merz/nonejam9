enum clientes{
	alien,
	demonio,
	moon_amarelo,
	moon_roxo,
	peixe
}

type = 0

image_alpha = 0

state = "espera"
destino_x = 0
destino_y = 0
vel = 1

front_spr = noone
wait_spr = noone
back_spr = noone

cd_wait = seconds(5)
espera_wait = 0
waiting = false
served = false

set_sprites = function(_spr_front, _spr_wait, _spr_back){
	front_spr = _spr_front
	wait_spr = _spr_wait
	back_spr = _spr_back
}