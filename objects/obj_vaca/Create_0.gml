//Herdando o evento
event_inherited()

//Vida
max_vida = [2, 3, 3, 4]
vida = max_vida[global.dificuldade]

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

//Item que vou dar quando morrer
if(spr == "spr_vaca_preta"){
	item = itens.carne_crua
}else if(spr == "spr_vaca_marrom"){
	item = itens.leite
}

som_dano = function(){
	audio_play_sound((choose(snd_vaca_dano1, snd_vaca_dano2, snd_vaca_dano3)), 1, 0, 
	1, 0, random_range(.8, 1.2))
}