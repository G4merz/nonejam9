//Herdando o evento
event_inherited()

//Vida
max_vida = [1, 2, 3, 5]
vida = max_vida[global.dificuldade]

//Item que vou dar quando morrer
item = itens.ovo

//Cooldown
min_cd = 0.75
max_cd = 1.5

//Velocidade
min_vel = [1, 1, 2, 4]
max_vel = [2, 3, 3, 7]

//Animação
shooting_mode = 1 //1 para animais, 2 para plantas
scale = random_range(1, 1.1)

spr = choose("spr_galinha_branca", "spr_galinha_preta")
idle_spr = asset_get_index(spr + "_idle")
walk_spr = asset_get_index(spr + "_walk")

image_spd = 8 / game_get_speed(gamespeed_fps) //Velocidade manual (10 FPS)