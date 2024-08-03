//Herdando o evento
event_inherited()

//Vida
max_vida = [2, 2, 3, 3]
vida = max_vida[global.dificuldade]

//Item que vou dar quando morrer
item = itens.tomate

//Cooldown
min_cd = 1
max_cd = 1.5

//Velocidade
min_vel = [1, 1, 2, 2.5]
max_vel = [1, 2, 2.5, 3]

//Animação
shooting_mode = 2 //1 para animais, 2 para plantas

idle_spr = spr_tomate_idle
walk_spr = spr_tomate_walk

image_spd = 6 / game_get_speed(gamespeed_fps) //Velocidade manual (10 FPS)