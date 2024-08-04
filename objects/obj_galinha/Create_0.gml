//Herdando o evento
event_inherited()

//Vida
max_vida = [1, 1, 2, 3]
vida = max_vida[global.dificuldade]

//Item que vou dar quando morrer
item = itens.ovo

//Cooldown
min_cd = 0.75
max_cd = 1.5

//Velocidade
min_vel = [1, 1.75, 2, 3]
max_vel = [2, 2.5, 3, 5]

//Animação
shooting_mode = 1 //1 para animais, 2 para plantas

spr = choose("spr_galinha_branca", "spr_galinha_preta")
idle_spr = asset_get_index(spr + "_idle")
walk_spr = asset_get_index(spr + "_walk")

image_spd = 8 / game_get_speed(gamespeed_fps) //Velocidade manual (10 FPS)

som_dano = function(){
	audio_play_sound((choose(snd_galinha_dano1, snd_galinha_dano2)), 1, 0, 
	1, 0, random_range(.8, 1.2))
}