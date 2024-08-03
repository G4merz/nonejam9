//Herdando o evento
event_inherited()

//Vida
max_vida = [2, 3, 3, 4]
vida = max_vida[global.dificuldade]

//Item que vou dar quando morrer
item = choose(itens.leite, itens.carne_crua)

//Cooldown
min_cd = 1
max_cd = 2.5

//Velocidade
min_vel = [.7, 1, 1.5, 2]
max_vel = [1.5, 1.5, 2, 3]

//Animação
shooting_mode = 1 //1 para animais, 2 para plantas

spr = choose("spr_vaca_preta", "spr_vaca_marrom")
idle_spr = asset_get_index(spr + "_idle")
walk_spr = asset_get_index(spr + "_walk")

image_spd = 2 / game_get_speed(gamespeed_fps) //Velocidade manual (10 FPS)