//Direção que ela está indo (-1 ou 1)
dir = 1

//Vida
max_vida = [1, 1, 1, 1]
vida = max_vida[global.dificuldade]

spawned = false

//Item que vou dar quando morrer
item = itens.burguer

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
shooting_mode = 1
scale = 1

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
	if(vida <= 0){
		add_item(item)
		instance_destroy()
	}
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