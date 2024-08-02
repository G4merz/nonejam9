//Definindo a escala
image_xscale = scale
image_yscale = scale

/*Se o cooldown do estado acabar, eu tenho 50% de chance de mudar de estado e mudo o tempo
do cooldown*/
if(espera_estado = 0){
	estado = choose("idle", "walk", "walk")
	cd_estado = seconds(irandom_range(2, 5))
	espera_estado = cd_estado
}

//Diminuindo o cooldown de estado
espera_estado = approach(espera_estado, 0, 1)

//Velocidade (setando no step porque tá bugado no create)
if(vel = 0){
	vel = irandom_range(min_vel[global.dificuldade], max_vel[global.dificuldade])
}

//Se o estado for idle, mudo para a sprite certa
//Se o estado for walk, ando e mudo para a sprite certa
if(estado = "idle"){
	if(sprite != idle_spr) image_ind = 0
	sprite = idle_spr
}else if(estado = "walk"){
	if(sprite != walk_spr) image_ind = 0
	x += vel * dir
	sprite = walk_spr
}

//Animando
animando()

//Mudando o alpha
alpha = approach(alpha, (shooting_mode = global.shooting) ? 1 : 0, 0.1)

//Dando um item novo caso eu morra
morrer()

//Me destruindo caso eu saia da room
if(x > 0 and x < room_width){
	spawned = true
}

if(x < 0 - sprite_get_width(sprite) * scale or x > room_width + sprite_get_width(sprite) * scale and spawned){
	instance_destroy()
}
