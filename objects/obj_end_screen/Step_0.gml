if(room != rm_end) exit

b_alpha = approach(b_alpha, 0, 0.01)
if(!audio_is_playing(msc_result)) audio_play_sound(msc_result, 1, 1)

balas = global.balas
pontos = balas + pedidos * 10 - pedidos_perdidos * 15 + bonus_dificuldade[global.dificuldade]

switch(state){
	case 0: 
		espera_state--
		if(espera_state = 0){
			state++
			espera_state = cd_state
			quicksound(snd_poof)
		}
		break
	case 1: 
		draw_balas=true
		if(shake_balas > 0) shake_balas-=0.1
		espera_state--
		if(espera_state = 0){
			state++
			espera_state = cd_state
			quicksound(snd_poof)
		}
		break
	case 2: 
		draw_pedidos=true
		if(shake_pedidos > 0) shake_pedidos-=0.1
		espera_state--
		if(espera_state = 0){
			state++
			espera_state = cd_state
			quicksound(snd_poof)
		}
		break
	case 3: 
		draw_pedidos_perdidos=true
		if(shake_pedidos_perdidos > 0) shake_pedidos_perdidos-=0.1
		espera_state--
		if(espera_state = 0){
			state++
			espera_state = cd_state
			if(pontos > 50) quicksound(snd_poof)
			else{
				quicksound(snd_nota_F)
				quicksound(snd_crowd_triste)
				ended = true
			}
		}
		break
	case 4:
		if(index < 5 and pontos >= rank[index + 1] and espera_rank = 0){
			index += 1
			pitch += 0.1
			espera_rank = intervalo_rank
			scale_rank = 1.75
			
			audio_play_sound(snd_nota_BC, 1, 0, 1, 0, pitch)
			if(index = 5 or pontos < rank[index + 1]){
				switch(index){
					case 1: audio_play_sound(snd_nota_BC, 1, 0, 1, 0, pitch); break
					case 2: audio_play_sound(snd_nota_BC, 1, 0, 1, 0, pitch); break
					case 3: quicksound(snd_nota_AS); break
					case 4: quicksound(snd_nota_AS); break
					case 5: quicksound(snd_nota_SS); quicksound(snd_crowd_feliz); break
				}
				
				ended = true
			}else{
				//audio_play_sound(snd_nota_BC, 1, 0, 1, 0, pitch)
			}
		}

		espera_rank = approach(espera_rank, 0, 1)
		scale_rank = lerp(scale_rank, 1.25, 0.1)
		
		if(ended and keyboard_check_pressed(vk_escape)){
			if(sequence = noone) sequence = layer_sequence_create("sequencia", 0, 0, sq_transicao)
			else{
				if(layer_sequence_get_headpos(sequence) = 60){
					layer_sequence_destroy(sequence)
					reset_game()
				}
			}
		}
	break
}