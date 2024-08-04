/*Criando uma variável temporária para acessar a DS List de itens sendo segurados
pelo player de forma mais legível e fácil*/
var _pinv = global.inventory
var _pos_in_list = ds_list_find_index(_pinv, id)

//Definindo o nome de acordo com meu index
nome = nomes[index]

/*Caso eu colida com o player, e eu estiver no chão, me adiciono
na DS List do player se eu ainda não estiver lá*/
if(estado = item_states.dropped){
	if(place_meeting(x, y, chef)){
		if(ds_list_size(_pinv) < global.max_inventory){
			if(_pos_in_list = -1){
				ds_list_add(_pinv, id)
				if(play_sound) quicksound(snd_pegar_item)
				estado = item_states.player
			}
		}
	}
}

//Se estou sendo segurado, mudo minha posição para seguir o player
if(estado = item_states.player){
	xx = lerp(xx, chef.x - (chef.velh * _pos_in_list * 1.5), 0.5 -  min((0.05 * _pos_in_list), 0.25))
	yy = lerp(yy, chef.y - 36 - (8 * _pos_in_list), 0.45 - min((0.04 * _pos_in_list), 0.25))
	
	img_angle = lerp_direction(img_angle, _pos_in_list * 10 * sign(round(chef.velh)), 0.2)
	
	image_angle = img_angle
	
	//Deixando minha profundidade menor que a do player
	depth = chef.depth - 300 - _pos_in_list
}else if(estado = item_states.dropped){
	adjust_depth()
	
	yy = wave(y - 5, y + 5, 2)
}

