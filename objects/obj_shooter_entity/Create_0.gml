//Direção que ela está indo (-1 ou 1)
dir = 1

//Vida
max_vida = [1, 1, 1, 1]
vida = max_vida[global.dificuldade]

spawned = false

//Item que vou dar quando morrer
item = itens.burguer


//Som de tomar dano
damage_sound = noone

//Cooldown
min_cd = 1
max_cd = 1

//Estado (idle ou walk)
estado = choose("idle", "walk")
cd_estado = seconds(irandom_range(min_cd, max_cd)) //Tempo até ela mudar de estado
espera_estado = cd_estado

//Velocidade
min_vel = [1, 1, 1, 1]
max_vel = [1, 1, 1, 1]
vel = 0

//Animação
sprite = sprite_index
alpha = 0
d_alpha = 0
shooting_mode = 1
shake = 0

var _ymin = room_height / 2
var _ymax = room_height  - 65
scale = 0.8 + ((y - _ymin) / (_ymax - _ymin) * 0.6)

idle_spr = spr_vaca_preta_idle
walk_spr = spr_vaca_preta_walk

image_ind = 0 //Index manual
image_num = 0 //Quantidade de frames na minha sprite atual
image_spd = 10 / game_get_speed(gamespeed_fps) //Velocidade manual (10 FPS)
def_image_spd = 10 / game_get_speed(gamespeed_fps)

//Animação
animando = function(){
	//Pegando quantos frames minha sprite atual tem
	image_num = sprite_get_number(sprite)
	
	//Aumentando o valor do index com base na velocidade
	image_ind += image_spd
	
	//Zerando o image_ind quando acabar a animação
	image_ind %= image_num
}

morrer = function(){
	add_item(item)

	var _inst = instance_create_depth(x, y - sprite_get_height(sprite), -2000, obj_get_item)
	_inst.sprite_index = spr_ingredientes
	_inst.image_index = item

	instance_destroy()
}

///@method som_dano() Altere esta função quando a entidade tiver que tocar algum som quando sofre dano.
som_dano = function(){

}

dano = function(_dano = 1){
	vida -= _dano
	shake = 5
	d_alpha = 1.5
	som_dano()
	
	if(vida <= 0){
		obj_shooter.burst(x, y, sprite_get_width(sprite), sprite_get_height(sprite))
		morrer()
	}
}

draw = function(){
	var _xoff = random_range(-shake, shake)
	var _yoff = random_range(-shake, shake)
	
	draw_sprite_ext(sprite, image_ind, x + _xoff, y + _yoff, dir * image_xscale, image_yscale, 0, c_white, alpha)
	draw_sprite_ext(sprite, image_ind, x + _xoff, y + _yoff, dir * image_xscale, image_yscale, 0, c_red, d_alpha)
}

/* Copie aqui para criar um novo bicho

//Vida
max_vida = [1, 1, 1, 1]
vida = max_vida[global.dificudade]

//Item que vou dar quando morrer
item = itens.burguer

//Cooldown
min_cd = 1
max_cd = 1

//Velocidade
min_vel = [1, 1, 1, 1]
max_vel = [1, 1, 1, 1]

//Animação
shooting_mode = 1 //1 para animais, 2 para plantas
scale = 1

idle_spr = spr_vaca_preta_idle
walk_spr = spr_vaca_preta_walk

image_spd = 10 / game_get_speed(gamespeed_fps) //Velocidade manual (10 FPS)
*/