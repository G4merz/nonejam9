switch(type){
	case clientes.alien:
		set_sprites(spr_alien_front, spr_alien_wait, spr_alien_back)
		break
	case clientes.demonio:
		set_sprites(spr_demonio_front, spr_demonio_wait, spr_demonio_back)
		break
	case clientes.moon_amarelo:
		set_sprites(spr_moon_amarelo_front, spr_moon_amarelo_wait, spr_moon_amarelo_wait)
		break
	case clientes.moon_roxo:
		set_sprites(spr_moon_roxo_front, spr_moon_roxo_wait, spr_moon_roxo_wait)
		break
	case clientes.peixe:
		set_sprites(spr_peixe_front, spr_peixe_wait, spr_peixe_front)
		break
}

if(state = "saindo"){

	var _dir = point_direction(x, y, destino_x, destino_y)
	x += min(lengthdir_x(vel, _dir), abs(destino_x - x))
	y += min(lengthdir_y(vel, _dir), abs(destino_y - y))
	
	sprite_index = front_spr
	if(type = clientes.alien) sprite_index = spr_alien_front
	if(type = clientes.peixe) image_xscale = -1
	
	image_alpha = approach(image_alpha, 0, 0.01)
	if(x = destino_x and y = destino_y){
		instance_destroy()
	}
}

if(state = "espera"){
	image_alpha = approach(image_alpha, 1, 0.01)
	
	if(espera_wait = 0){
		waiting = !waiting
		cd_wait = seconds(irandom_range(2, 5))
		espera_wait = cd_wait
	}
	
	sprite_index = (waiting) ? wait_spr : back_spr
	
	espera_wait = approach(espera_wait, 0, 1)
	
	if(served){
		state = "saindo"
		destino_x = x
		destino_y = 600
	}
}