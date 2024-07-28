#region Variáveis básicas de entidade
//Movimento
velh = 0
velv = 0
max_vel = 1

//Animação
olhando = 0 //0 Direita, 1 Cima, 2 Esquerda, 3 Baixo
xscale = 1
sprite = sprite_index

image_ind = 0 //Index manual
image_num = 0 //Quantidade de frames na minha sprite atual
image_spd = 30 / game_get_speed(gamespeed_fps) //Velocidade manual (30 FPS)
def_image_spd = 30 / game_get_speed(gamespeed_fps)

sprites = [
			//Sprites Parado
			[
			spr_quad,
			spr_quad,
			spr_quad,
			spr_quad
			]
]
sprites_index = 0

#endregion

//Debug
debug = false

//Colisão
collide = function(_object = obj_colisao){
	if(place_meeting(x + velh, y, _object)){
		var _colisao = instance_place(x + velh, y, _object)
	
		x = (velh > 0) ? _colisao.bbox_left + (x - bbox_right) : _colisao.bbox_right + (x - bbox_left)
		velh = 0
	}

	x += velh

	if(place_meeting(x, y + velv, _object)){
		var _colisao = instance_place(x, y + velv, _object)
	
		y = (velv > 0) ? _colisao.bbox_top + (y - bbox_bottom) : _colisao.bbox_bottom + (y - bbox_top)
		velv = 0
	}

	y += velv
}

//Animação
animando = function(_sprites_index){
	//Checando se a minha sprite atual é a que eu deveria estar usando
	if(sprite != sprites[_sprites_index][olhando]){
		image_ind = 0
	}
	
	sprite = sprites[_sprites_index][olhando]
	
	//Pegando quantos frames minha sprite atual tem
	image_num = sprite_get_number(sprite)
	
	//Se o vetor tiver alguma velocidade específica, eu mudo pra ela
	if(array_length(sprites[_sprites_index]) > 4){
		image_spd = sprites[_sprites_index][4] / game_get_speed(gamespeed_fps)
	}else{
		image_spd = def_image_spd
	}
	
	//Aumentando o valor do index com base na velocidade
	image_ind += image_spd
	
	//Zerando o image_ind quando acabar a animação
	image_ind %= image_num
}