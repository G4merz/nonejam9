//Herdando o evento
event_inherited()

//Vida
max_vida = [1, 2, 3, 4]
vida = max_vida[global.dificuldade]

//Item que vou dar quando morrer
item = itens.cacau

//Cooldown
min_cd = 1.25
max_cd = 1.75

//Velocidade
min_vel = [0.5, 0.75, 1, 2]
max_vel = [1, 1, 1.5, 2.5]

//Animação
shooting_mode = 2 //1 para animais, 2 para plantas

idle_spr = spr_cacau_idle
walk_spr = spr_cacau_walk

image_spd = 6 / game_get_speed(gamespeed_fps) //Velocidade manual (6 FPS)

som_dano = function(){
	quicksound(snd_folha_dano)
}