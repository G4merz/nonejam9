if(global.dificuldade < 3 and tempo > 0){
	shooter_volume = global.shooting
	if(prev_shooter_volume != shooter_volume) audio_sound_gain(shooter_music[global.dificuldade], shooter_volume, fade_spd * 2)
	prev_shooter_volume = shooter_volume

	kitchen_volume = !global.shooting
	if(prev_kitchen_volume != kitchen_volume) audio_sound_gain(msc_cozinha_1, kitchen_volume, fade_spd)
	prev_kitchen_volume = kitchen_volume
}

layer_depth("paredes_1", obj_chefinho.depth - 1)
layer_depth("paredes_2", 200)
layer_depth("deco", layer_get_depth("paredes_1") - 1)

#region Sons para cada bicho do estande
if(!global.paused){
	if(global.shooting = 1){
		var _shiny = instance_exists(obj_vaca_estrela)
		if(instance_exists(obj_vaca)){
			if(chance(0.0085)){
				audio_play_sound(choose(snd_vaca1, snd_vaca2, snd_vaca3), 1, 0, (_shiny) ? 0.53: 1)
			}
		}
	
		if(instance_exists(obj_galinha)){
			if(chance(0.0085)){
				audio_play_sound(choose(snd_galinha1, snd_galinha2), 1, 0, (_shiny) ? 0.3 : 1)
			}
		}
		
		
		if(_shiny and !audio_is_playing(snd_vaca_shiny)){
			quicksound(snd_vaca_shiny)
		}
	}else if(global.shooting = 2){
		if((instance_exists(obj_cacau) or instance_exists(obj_tomate) or instance_exists(obj_trigo))
		and !audio_is_playing(snd_folhas_andando)){
			quicksound(snd_folhas_andando)
		}
	}
	
	if(global.shooting == false){
		audio_stop_sound(snd_folhas_andando)
		audio_stop_sound(snd_vaca_shiny)
	}
}
#endregion

if(!instance_exists(obj_pause_menu)) global.pause_delay = approach(global.pause_delay, 0, 1)

if(!global.paused) tempo = approach(tempo, 0, 1)
if(tempo = 0){
	global.paused = true
	if(global.dificuldade < 3) audio_sound_gain(shooter_music[global.dificuldade], 0, fade_spd * 3)
	else audio_sound_gain(shooter_music, 0, fade_spd * 2)
	
	audio_sound_gain(kitchen_music, 0, fade_spd * 2)
}