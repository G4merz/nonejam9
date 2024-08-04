//Herdando o evento
event_inherited()

//Vida
max_vida = [2, 3, 3, 5]
vida = max_vida[global.dificuldade]

//Item que vou dar quando morrer
item = 0

//Cooldown
min_cd = 1
max_cd = 2.5

//Velocidade
min_vel = [.7, 1, 1.5, 2]
max_vel = [1.5, 1.5, 2, 3]

//Animação
shooting_mode = 1 //1 para animais, 2 para plantas

idle_spr = spr_vaca_estrela_idle
walk_spr = spr_vaca_estrela_walk

image_spd = 2 / game_get_speed(gamespeed_fps) //Velocidade manual (10 FPS)

morrer = function(){
	if(vida <= 0){
		var _leites = irandom_range(2, 4)
		var _carnes = irandom_range(2, 4)
		add_item(itens.leite, _leites)
		add_item(itens.carne_crua, _carnes)
		
		for(var i = 0; i < _leites; i++){
			var _inst = instance_create_depth(x - 15, y - sprite_get_height(sprite) - 10 * i, -2000, obj_get_item)
			_inst.sprite_index = spr_ingredientes
			_inst.image_index = itens.leite
			_inst.dec = 0.0001
		}
		
		for(var i = 0; i < _carnes; i++){
			var _inst = instance_create_depth(x + 15, y - sprite_get_height(sprite) - 10 * i, -2000, obj_get_item)
			_inst.sprite_index = spr_ingredientes
			_inst.image_index = itens.carne_crua
			_inst.dec = 0.0001
		}
		instance_destroy()
	}
}

som_dano = function(){
	audio_play_sound((choose(snd_vaca_dano1, snd_vaca_dano2, snd_vaca_dano3)), 1, 0, 
	1, 0, random_range(.8, 1.2))
}