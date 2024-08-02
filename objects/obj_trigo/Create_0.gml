//Herdando o evento
event_inherited()

//Vida
max_vida = [1, 2, 2, 4]
vida = max_vida[global.dificuldade]

//Item que vou dar quando morrer
item = itens.trigo

//Cooldown
min_cd = 0.5
max_cd = 1

//Velocidade
min_vel = [1, 1, 2, 3]
max_vel = [2, 3, 3, 5]

//Animação
shooting_mode = 2 //1 para animais, 2 para plantas
scale = random_range(0.9, 1.1)

idle_spr = spr_trigo_idle
walk_spr = spr_trigo_walk

image_spd = 8 / game_get_speed(gamespeed_fps) //Velocidade manual (10 FPS)